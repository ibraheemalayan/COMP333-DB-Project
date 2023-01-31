from silal_payments.models.users.user import User, UserType
from silal_payments import db
from sqlalchemy.engine import Result, Row


class Customer(User):

    table_name = "customer"

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

        db.engine.execute(
            f"""INSERT INTO public.{self.table_name} (user_id, address, card_number) VALUES (%d, %s, %s);""",
            (
                self.user_id,
                self.address,
                self.card_number,
            ),
        )

        return self.user_id

    def __str__(self) -> str:
        return f"""Customer: user_id={self.user_id} phone={self.phone} user_type={self.user_type} full_name={self.full_name} email={self.email} address={self.address} card_number={self.card_number}"""


def load_customer_from_db(user_id: int) -> Customer:
    """Load a customer from the database"""

    user: Row = db.engine.execute(
        f"""SELECT * FROM public.{Customer.table_name} WHERE user_id = %d""",
        (user_id,),
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
