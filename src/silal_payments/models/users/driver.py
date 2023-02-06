from sqlalchemy import text
from silal_payments.models.users.user import User, UserType
from silal_payments import db
from sqlalchemy.engine import Result, Row
from silal_payments.models.transactions.transaction import Transaction


class Driver(User):
    sub_table_name = "driver"

    def __init__(
        self,
        user_id: int,
        phone: str,
        full_name: str,
        password_hash: str,
        email: str,
        bank_account: str,
    ):
        super().__init__(
            user_id, phone, UserType.driver, full_name, password_hash, email
        )

        self.bank_account: str = bank_account

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
        return f"""Driver: user_id={self.user_id} phone={self.phone} user_type={self.user_type} full_name={self.full_name} email={self.email} bank_account={self.bank_account}"""

    @staticmethod
    def load_by_id(user_id: int):
        """Load a Driver from the database"""

        user: Row = db.session.execute(
            text(
                f"""
                SELECT
                    public.{Driver.sub_table_name}.user_id,
                    public.{User.table_name}.phone,
                    public.{User.table_name}.user_type,
                    public.{User.table_name}.full_name,
                    public.{User.table_name}.password_hash,
                    public.{User.table_name}.email,
                    public.{Driver.sub_table_name}.bank_account
                FROM
                    public.{Driver.sub_table_name} LEFT JOIN public.{User.table_name}
                    ON public.{Driver.sub_table_name}.user_id=public.{User.table_name}.user_id
                WHERE public.{User.table_name}.user_id = :user_id
            """
            ).bindparams(user_id=user_id),
        ).first()

        if user is None:
            return None

        return Driver(
            user_id=user[0],
            phone=user[1],
            full_name=user[3],
            password_hash=user[4],
            email=user[5],
            bank_account=user[6],
        )

    def get_balance(self):
        """Get the balance of the driver"""
        result: Result = db.session.execute(
            text(
                f"""
                SELECT
                    SUM(public.driver_company_transaction.transaction_amount)
                FROM
                    public.driver_company_transaction
                WHERE
                    public.driver_company_transaction.driver_id = :driver_id
            """
            ).bindparams(driver_id=self.user_id),
        )

        balance: Row = result.first()

        if balance is None:
            return 0

        return balance[0]


def select_company_driver_transactions(driver_id: int):
    """Get the balance of the driver"""
    result: Result = db.session.execute(
        text(
            f"""
            SELECT
                public.transaction.transaction_id,
                public.transaction.transaction_amount,
                public.transaction.transaction_date,
                public.transaction.transaction_type
            FROM
                public.transaction
            JOIN public.driver_company_transaction
            ON public.driver_company_transaction.transaction_id = public.transaction.transaction_id AND public.driver_company_transaction.driver_id = :driver_id
            UNION
            SELECT
                public.transaction.transaction_id,
                public.transaction.transaction_amount,
                public.transaction.transaction_date,
                public.transaction.transaction_type
            FROM
                public.transaction
            JOIN public.company_driver_transaction
            ON public.company_driver_transaction.transaction_id = public.transaction.transaction_id AND public.company_driver_transaction.driver_id = :driver_id
            ORDER BY transaction_date DESC
        """
        ).bindparams(driver_id=driver_id)
    )
    transactions = []
    for row in result:
        transactions.append(
            Transaction(
                transaction_id=row[0],
                transaction_amount=row[1],
                transaction_date=row[2],
                transaction_type=row[3],
            )
        )
    return transactions
