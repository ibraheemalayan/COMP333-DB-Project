from time import strptime
from silal_payments import db
from sqlalchemy import text
from sqlalchemy.engine import Result, Row
from silal_payments.models.transactions.transaction import Transaction, TransactionType

import datetime


class CustomerCompanyTransaction(Transaction):
    sub_table_name = "customer_company_transaction"

    def __init__(
        self,
        transaction_id: int,
        transaction_type: TransactionType,
        transaction_amount: float,
        transaction_date: datetime,
        customer_id: int,
    ):
        super().__init__(
            transaction_id,
            transaction_type.customer_company_transaction,
            transaction_amount,
            transaction_date,
        )
        self.customer_id = customer_id

    def insert_into_db(self):
        super().insert_into_db()
        stmt = text(
            f"""INSERT INTO public.{self.sub_table_name} (customer_id, transaction_id) VALUES (:customer_id, :transaction_id);"""
        ).bindparams(
            customer_id=self.customer_id,
            transaction_id=self.transaction_id,
        )

        db.session.execute(stmt)
        db.session.commit()
