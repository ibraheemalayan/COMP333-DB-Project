from time import strptime
from silal_payments import db
from sqlalchemy import text
from sqlalchemy.engine import Result, Row
from silal_payments.models.transactions.transaction import Transaction, TransactionType

from datetime import datetime


class CustomerDriverTransaction(Transaction):
    sub_table_name = "customer_driver_transaction"

    def __init__(
        self,
        transaction_id: int,
        transaction_amount: float,
        transaction_date: datetime,
        customer_id: int,
        driver_id: int,
    ):
        super().__init__(
            transaction_id,
            TransactionType.customer_driver_transaction,
            transaction_amount,
            transaction_date,
        )
        self.customer_id = customer_id
        self.driver_id = driver_id

    def insert_into_db(self):
        super().insert_into_db()
        stmt = text(
            f"""INSERT INTO public.{self.sub_table_name} (customer_id, driver_id, transaction_id) VALUES (:customer_id, :driver_id, :transaction_id);"""
        ).bindparams(
            customer_id=self.customer_id,
            driver_id=self.driver_id,
            transaction_id=self.transaction_id,
        )

        db.session.execute(stmt)
        db.session.commit()


# def load_customer_driver_transaction_from_db(
#     transaction_id: int,
# ) -> CustomerDriverTransaction:
#     """Load a customer_driver_transaction from the database"""
#     stmt = text(
#         f"""
#         SELECT
#             public.{CustomerDriverTransaction.sub_table_name}.transaction_id,
#             public.{Transaction.table_name}.transaction_amount,
#             public.{Transaction.table_name}.transaction_date,
#             public.{CustomerDriverTransaction.sub_table_name}.customer_id,
#             public.{CustomerDriverTransaction.sub_table_name}.driver_id
#         FROM public.{CustomerDriverTransaction.sub_table_name}
#         INNER JOIN public.{Transaction.table_name}
#         ON public.{CustomerDriverTransaction.sub_table_name}.transaction_id = public.{Transaction.table_name}.transaction_id
#         WHERE public.{CustomerDriverTransaction.sub_table_name}.transaction_id = :transaction_id;
#         """
#     ).bindparams(transaction_id=transaction_id)
#     result: Result = db.session.execute(stmt)
#     transaction: Row = result.first()

#     if transaction is None:
#         return None

#     return CustomerDriverTransaction(
#         transaction_id=transaction[0],
#         transaction_amount=transaction[1],
#         transaction_date=transaction[2],
#         customer_id=transaction[3],
#         driver_id=transaction[4],
#     )
