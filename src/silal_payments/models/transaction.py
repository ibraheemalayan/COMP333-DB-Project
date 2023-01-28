from enum import Enum
from time import strptime
from silal_payments import db
from sqlalchemy import text

from datetime import datetime


class TransactionType(Enum):
    customer_driver_transaction = "customer_driver_transaction"
    customer_company_transaction = "customer_company_transaction"
    company_driver_transaction = "company_driver_transaction"
    company_seller_transaction = "company_seller_transaction"
    company_customer_transaction = "company_customer_transaction"


class Transaction:

    table_name = "transaction"

    def __init__(
        self,
        transaction_id: int,
        transaction_type: TransactionType,
        transaction_amount: float,
        transaction_date: datetime,
    ):
        self.transaction_id = transaction_id
        self.transaction_type = transaction_type
        self.transaction_amount = transaction_amount
        self.transaction_date = transaction_date

    def insert_into_db(self):

        stmt = text(
            f"""INSERT INTO public.{self.table_name} (transaction_type, transaction_amount, transaction_date) VALUES (:transaction_type, :transaction_amount, :transaction_date)"""
        ).bindparams(
            transaction_date=self.transaction_date,
            transaction_amount=self.transaction_amount,
            transaction_type=self.transaction_type.value,
        )

        db.engine.execute(stmt)

    def __str__(self) -> str:
        return f"""Transaction: transaction_id={self.transaction_id} transaction_type={self.transaction_type} transaction_amount={self.transaction_amount} transaction_date={self.transaction_date}"""


def load_transactions_from_db():
    result = db.engine.execute(f"""SELECT * FROM public.{Transaction.table_name}""")

    transactions = []

    for row in result:
        transactions.append(
            Transaction(
                transaction_id=row[0],
                transaction_type=TransactionType(row[1]),
                transaction_amount=row[2],
                transaction_date=strptime(row[3]),
            )
        )

    return transactions
