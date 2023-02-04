from time import strptime
from silal_payments import db
from sqlalchemy import text
from sqlalchemy.engine import Result, Row
from silal_payments.models.transactions.transaction import Transaction, TransactionType

import datetime


class SellerCompanyTransaction(Transaction):
    sub_table_name = "seller_company_transaction"

    def __init__(
        self,
        transaction_id: int,
        transaction_type: TransactionType,
        transaction_amount: float,
        transaction_date: datetime,
        seller_id: int,
    ):
        super().__init__(
            transaction_id,
            transaction_type.seller_company_transaction,
            transaction_amount,
            transaction_date,
        )
        self.seller_id = seller_id

    def insert_into_db(self):
        super().insert_into_db()
        stmt = text(
            f"""INSERT INTO public.{self.sub_table_name} (seller_id, transaction_id) VALUES (:seller_id, :transaction_id);"""
        ).bindparams(
            seller_id=self.seller_id,
            transaction_id=self.transaction_id,
        )

        db.session.execute(stmt)
        db.session.commit()
