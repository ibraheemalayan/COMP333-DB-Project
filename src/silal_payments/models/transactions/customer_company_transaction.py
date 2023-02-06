from time import strptime
from silal_payments import db
from sqlalchemy import text
from sqlalchemy.engine import Result, Row
from silal_payments.models.transactions.transaction import Transaction, TransactionType
from silal_payments.models.users.customer import Customer
from silal_payments.models.order import Order

import datetime


class CustomerCompanyTransaction(Transaction):
    sub_table_name = "customer_company_transaction"

    def __init__(
        self,
        transaction_id: int,
        transaction_amount: float,
        transaction_date: datetime,
        customer_id: int,
        order_id: int,
    ):
        super().__init__(
            transaction_id,
            TransactionType.customer_company_transaction,
            transaction_amount,
            transaction_date,
        )
        self.customer_id = customer_id
        self.order_id = order_id

    def insert_into_db(self):
        super().insert_into_db()
        stmt = text(
            f"""INSERT INTO public.{self.sub_table_name} (customer_id, transaction_id, order_id) VALUES (:customer_id, :transaction_id, :order_id);"""
        ).bindparams(
            customer_id=self.customer_id,
            transaction_id=self.transaction_id,
            order_id=self.order_id,
        )

        db.session.execute(stmt)
        db.session.commit()


# def load_customer_company_transaction_from_db(
#     transaction_id: int,
# ) -> CustomerCompanyTransaction:
#     """Load a customer_company_transaction from the database"""
#     stmt = text(
#         f"""
#         SELECT
#             public.{CustomerCompanyTransaction.sub_table_name}.transaction_id,
#             public.{Transaction.table_name}.transaction_amount,
#             public.{Transaction.table_name}.transaction_date,
#             public.{CustomerCompanyTransaction.sub_table_name}.customer_id,
#             public.{CustomerCompanyTransaction.sub_table_name}.order_id
#         FROM public.{CustomerCompanyTransaction.sub_table_name}
#         INNER JOIN public.{Transaction.table_name}
#         ON public.{CustomerCompanyTransaction.sub_table_name}.transaction_id = public.{Transaction.table_name}.transaction_id
#         WHERE public.{CustomerCompanyTransaction.sub_table_name}.transaction_id = :transaction_id;
#         """
#     ).bindparams(transaction_id=transaction_id)
#     result: Result = db.session.execute(stmt)
#     transaction: Row = result.fetchone()

#     if transaction is None:
#         return None

#     return CustomerCompanyTransaction(
#         transaction_id=transaction[0],
#         transaction_amount=transaction[1],
#         transaction_date=transaction[2],
#         customer_id=transaction[3],
#         order_id=transaction[4],
#     )


def load_customer_company_transaction_details(transaction_id: int) -> tuple:
    """Load a customer_company_transaction from the database"""
    stmt = text(
        f"""
        SELECT
            public.{Customer.table_name}.user_id,
            public.{Customer.table_name}.full_name,
            public.{Order.table_name}.order_id,
            public.{CustomerCompanyTransaction.sub_table_name}.transaction_id,
            public.{Transaction.table_name}.transaction_amount,
            public.{Transaction.table_name}.transaction_date
        FROM public.{CustomerCompanyTransaction.sub_table_name}
        INNER JOIN public.{Transaction.table_name}
        ON public.{CustomerCompanyTransaction.sub_table_name}.transaction_id = public.{Transaction.table_name}.transaction_id
        INNER JOIN public.{Customer.table_name}
        ON public.{CustomerCompanyTransaction.sub_table_name}.customer_id = public.{Customer.table_name}.user_id
        INNER JOIN public.{Order.table_name}
        ON public.{CustomerCompanyTransaction.sub_table_name}.order_id = public.{Order.table_name}.order_id
        WHERE public.{CustomerCompanyTransaction.sub_table_name}.transaction_id = :transaction_id;
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
        Order(
            order_id=transaction[2],
            order_customer=None,
            order_driver=None,
            order_status=None,
            delivery_fee=None,
        ),
        CustomerCompanyTransaction(
            transaction_id=transaction[3],
            transaction_amount=transaction[4],
            transaction_date=transaction[5],
            customer_id=transaction[0],
            order_id=transaction[2],
        ),
    )
