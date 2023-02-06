from time import strptime
from silal_payments import db
from sqlalchemy import text
from sqlalchemy.engine import Result, Row
from silal_payments.models.transactions.transaction import Transaction, TransactionType
from silal_payments.models.users.customer import Customer
from silal_payments.models.users.driver import Driver

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


def load_customer_driver_transaction_details(transaction_id: int) -> tuple:
    """load customer driver transaction details from the database"""

    stmt = text(
        f"""
        SELECT
            u1.user_id AS customer_id,
            u1.full_name AS customer_full_name,
            u2.user_id AS driver_id,
            u2.full_name AS driver_full_name,
            public.{CustomerDriverTransaction.sub_table_name}.transaction_id,
            public.{Transaction.table_name}.transaction_amount,
            public.{Transaction.table_name}.transaction_date
        FROM public.{CustomerDriverTransaction.sub_table_name}
        INNER JOIN public.{Transaction.table_name}
        ON public.{CustomerDriverTransaction.sub_table_name}.transaction_id = public.{Transaction.table_name}.transaction_id
        INNER JOIN public.{Customer.table_name} AS u1
        ON public.{CustomerDriverTransaction.sub_table_name}.customer_id = u1.user_id
        INNER JOIN public.{Driver.table_name} AS u2
        ON public.{CustomerDriverTransaction.sub_table_name}.driver_id = u2.user_id
        WHERE public.{CustomerDriverTransaction.sub_table_name}.transaction_id = :transaction_id;
        """
    ).bindparams(transaction_id=transaction_id)

    result: Result = db.session.execute(stmt)
    transaction: Row = result.first()

    if transaction is None:
        return None

    return (
        Customer(
            user_id=transaction[0],
            full_name=transaction[1],
            phone=None,
            password_hash=None,
            email=None,
            address=None,
            card_number=None,
        ),
        Driver(
            user_id=transaction[2],
            full_name=transaction[3],
            phone=None,
            bank_account=None,
            password_hash=None,
            email=None,
        ),
        CustomerDriverTransaction(
            transaction_id=transaction[4],
            transaction_amount=transaction[5],
            transaction_date=transaction[6],
            customer_id=transaction[0],
            driver_id=transaction[2],
        ),
    )
