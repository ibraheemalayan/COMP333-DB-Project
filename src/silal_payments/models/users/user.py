from enum import Enum

from sqlalchemy import text
from silal_payments import db

from sqlalchemy.engine import Result, Row

from flask_login import UserMixin


class UserType(Enum):
    manager = "manager"
    driver = "driver"
    seller = "seller"
    customer = "customer"


class User(UserMixin):
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

    def insert_into_db(self) -> int:
        user_id: Row = db.session.execute(
            text(
                f"""INSERT INTO public.{self.table_name} (phone, user_type, full_name, password_hash, email) VALUES (:phone, :user_type, :full_name, :password_hash, :email) RETURNING user_id""",
            ).bindparams(
                phone=self.phone,
                user_type=self.user_type.value,
                full_name=self.full_name,
                password_hash=self.password_hash,
                email=self.email,
            ),
        ).first()

        self.user_id = user_id[0]

        return self.user_id

    def __str__(self) -> str:
        return f"""User: user_id={self.user_id} phone={self.phone} user_type={self.user_type} full_name={self.full_name} email={self.email}"""

    # used by login module
    is_active = True  # This property should return True if this is an active user - in addition to being authenticated, they also have activated their account, not been suspended, or any condition your application has for rejecting an account. Inactive accounts may not log in (without being forced of course).

    def get_id(self) -> str:
        """
        This method must return a str that uniquely identifies this user, and can be used
        to load the user from the user_loader callback. Note that this must be a str - if
        the ID is natively an int or some other type, you will need to convert it to str.
        """

        return str(self.user_id)

    @staticmethod
    def load_by_id(user_id: int):
        """Load a seller from the database"""

        user: Row = db.session.execute(
            text(
                f"""
                SELECT
                    public.{User.table_name}.user_id,
                    public.{User.table_name}.phone,
                    public.{User.table_name}.user_type,
                    public.{User.table_name}.full_name,
                    public.{User.table_name}.password_hash,
                    public.{User.table_name}.email,
                FROM
                    public.{User.table_name}
                WHERE {User.table_name}.user_id = %d
            """
            ),
            (user_id,),
        ).first()

        if user is None:
            return None

        return User(
            user_id=user[0],
            phone=user[1],
            user_type=[2],
            full_name=user[3],
            password_hash=user[4],
            email=user[5],
        )


def load_user_from_db(user_id):
    result_set: Result = db.session.execute(
        text(f"""SELECT * FROM public.{User.table_name} WHERE user_id = %s"""),
        (user_id),
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


def get_user_by_email(email: str, user_type: UserType):
    result_set: Result = db.session.execute(
        text(
            f"""SELECT * FROM public.{User.table_name} WHERE email = %s AND user_type = %s"""
        ),
        (email, user_type.value),
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
