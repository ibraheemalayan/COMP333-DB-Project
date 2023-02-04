from sqlalchemy import text
from silal_payments.models.users.user import User, UserType
from silal_payments import db
from sqlalchemy.engine import Result, Row


class Customer(User):
    sub_table_name = "customer"

    def __init__(
        self,
        user_id: int,
        phone: str,
        full_name: str,
        password_hash: str,
        email: str,
        address: str,
        card_number: str,
    ):
        super().__init__(
            user_id, phone, UserType.customer, full_name, password_hash, email
        )

        self.address: str = address
        self.card_number: str = card_number

    def insert_into_db(self):
        super().insert_into_db()

        db.session.execute(
            text(
                f"""INSERT INTO public.{self.sub_table_name} (user_id, address, card_number) VALUES (:user_id, :address, :card_number);""",
            ).bindparams(
                user_id=self.user_id,
                address=self.address,
                card_number=self.card_number,
            )
        )

        return self.user_id

    def __str__(self) -> str:
        return f"""Customer: user_id={self.user_id} phone={self.phone} user_type={self.user_type} full_name={self.full_name} email={self.email} address={self.address} card_number={self.card_number}"""


def load_customer_from_db(user_id: int) -> Customer:
    """Load a customer from the database"""

    user: Row = db.session.execute(
        text(
            f"""
            SELECT
                public.{Customer.sub_table_name}.user_id,
                public.{User.table_name}.phone,
                public.{User.table_name}.user_type,
                public.{User.table_name}.full_name,
                public.{User.table_name}.password_hash,
                public.{Customer.sub_table_name}.email,
                public.{Customer.sub_table_name}.address,
                public.{Customer.sub_table_name}.card_number
            FROM
                public.{Customer.sub_table_name} LEFT JOIN
                ON public.{Customer.sub_table_name}=public.{User.table_name}
            WHERE {User.table_name}.user_id = %d
        """
        ).bindparams(
            user_id=user_id,
        ),
    ).first()

    if user is None:
        return None

    return Customer(
        user_id=user[0],
        phone=user[1],
        full_name=user[3],
        password_hash=user[4],
        email=user[5],
        address=user[6],
        card_number=user[7],
    )
