from typing import Self
from silal_payments.models.users.user import User, UserType
from silal_payments import db
from sqlalchemy.engine import Result, Row


class Manager(User):

    # sub_table_name = "manager"

    def __init__(
        self,
        user_id: int,
        phone: str,
        full_name: str,
        password_hash: str,
        email: str,
    ):

        super().__init__(
            user_id, phone, UserType.manager, full_name, password_hash, email
        )
