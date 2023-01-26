from enum import Enum
from silal_payments import db

from sqlalchemy.engine import Result, Row


class UserType(Enum):
    manager = "manager"
    driver = "driver"
    seller = "seller"
    customer = "customer"


class User:

    table_name = "user"

    def __init__(
        self,
        user_id: int,
        phone: str,
        user_type: UserType,
        full_name: str,
        password_hash: str,
        email: str,
    ):
        self.user_id = user_id
        self.phone = phone
        self.user_type = user_type
        self.full_name = full_name
        self.password_hash = password_hash
        self.email = email

    def insert_into_db(self):
        db.engine.execute(
            f"""INSERT INTO public.{self.table_name} (phone, user_type, full_name, password_hash, email) VALUES (%s, %s, %s, %s, %s)""",
            (
                self.phone,
                self.user_type.value,
                self.full_name,
                self.password_hash,
                self.email,
            ),
        )

    def __str__(self) -> str:
        return f"""User: user_id={self.user_id} phone={self.phone} user_type={self.user_type} full_name={self.full_name} email={self.email}"""


def load_user_from_db(user_id):

    result_set: Result = db.engine.execute(
        f"""SELECT * FROM public.{User.table_name} WHERE user_id = %s""", (user_id)
    )

    row: Row = result_set.first()

    if row:

        return User(
            user_id=row[0],
            phone=row[1],
            user_type=UserType(row[2]),
            full_name=row[3],
            password_hash=row[4],
            email=row[5],
        )

    return None


# name
