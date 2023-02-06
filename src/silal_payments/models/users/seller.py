from sqlalchemy import text
from silal_payments.models.users.user import User, UserType
from silal_payments import db
from sqlalchemy.engine import Result, Row


class Seller(User):
    sub_table_name = "seller"

    def __init__(
        self,
        user_id: int,
        phone: str,
        full_name: str,
        password_hash: str,
        email: str,
        bank_account: str,
        balance = 0,
    ):
        super().__init__(
            user_id, phone, UserType.seller, full_name, password_hash, email
        )

        self.bank_account: str = bank_account
        self.balance: float = balance

    def insert_into_db(self):
        super().insert_into_db()

        db.session.execute(
            text(
                f"""INSERT INTO public.{self.sub_table_name} (user_id, bank_account) VALUES (:user_id, :bank_account);""",
            ).bindparams(
                user_id=self.user_id,
                bank_account=self.bank_account,
            ),
        )

        return self.user_id

    def __str__(self) -> str:
        return f"""Seller: user_id={self.user_id} phone={self.phone} user_type={self.user_type} full_name={self.full_name} email={self.email} bank_account={self.bank_account}"""

    @staticmethod
    def load_by_id(user_id: int):
        """Load a seller from the database"""

        user: Row = db.session.execute(
            text(
                f"""
                SELECT
                    public.{Seller.sub_table_name}.user_id,
                    public.{User.table_name}.phone,
                    public.{User.table_name}.user_type,
                    public.{User.table_name}.full_name,
                    public.{User.table_name}.password_hash,
                    public.{User.table_name}.email,
                    public.{Seller.sub_table_name}.bank_account
                FROM
                    public.{Seller.sub_table_name} LEFT JOIN public.{User.table_name}
                    ON public.{Seller.sub_table_name}.user_id=public.{User.table_name}.user_id
                WHERE public.{User.table_name}.user_id = :user_id
            """
            ).bindparams(user_id=user_id),
        ).first()

        if user is None:
            return None

        return Seller(
            user_id=user[0],
            phone=user[1],
            full_name=user[3],
            password_hash=user[4],
            email=user[5],
            bank_account=user[6],
        )
