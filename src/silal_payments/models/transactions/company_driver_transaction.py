from time import strptime
from silal_payments import db
from sqlalchemy import text
from sqlalchemy.engine import Result, Row
from silal_payments.models.transactions.transaction import Transaction, TransactionType

from datetime import datetime


class CompanyDriverTransaction(Transaction):
    sub_table_name = "company_driver_transaction"

    def __init__(
        self,
        transaction_id: int,
        transaction_amount: float,
        transaction_date: datetime,
        driver_id: int,
    ):
        super().__init__(
            transaction_id,
            TransactionType.company_driver_transaction,
            transaction_amount,
            transaction_date,
        )
        self.driver_id = driver_id

    def insert_into_db(self):
        super().insert_into_db()
        stmt = text(
            f"""INSERT INTO public.{self.sub_table_name} (driver_id, transaction_id) VALUES (:driver_id, :transaction_id);"""
        ).bindparams(
            driver_id=self.driver_id,
            transaction_id=self.transaction_id,
        )

        db.session.execute(stmt)
        db.session.commit()


def load_company_driver_transaction_from_db(
    transaction_id: int,
) -> CompanyDriverTransaction:
    """Load a company_driver_transaction from the database"""
    stmt = text(
        f"""
        SELECT
            public.{CompanyDriverTransaction.sub_table_name}.transaction_id,
            public.{Transaction.table_name}.transaction_amount,
            public.{Transaction.table_name}.transaction_date,
            public.{CompanyDriverTransaction.sub_table_name}.driver_id
        FROM public.{CompanyDriverTransaction.sub_table_name}
        INNER JOIN public.{Transaction.table_name}
        ON public.{CompanyDriverTransaction.sub_table_name}.transaction_id = public.{Transaction.table_name}.transaction_id
        WHERE public.{CompanyDriverTransaction.sub_table_name}.transaction_id = :transaction_id;
        """
    ).bindparams(transaction_id=transaction_id)

    result: Result = db.session.execute(stmt)
    transaction: Row = result.fetchone()

    if transaction is None:
        return None

    return CompanyDriverTransaction(
        transaction_id=transaction[0],
        transaction_amount=transaction[1],
        transaction_date=transaction[2],
        driver_id=transaction[3],
    )
