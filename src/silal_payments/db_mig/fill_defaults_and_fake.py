from datetime import datetime, timedelta
from silal_payments import db
from silal_payments.models.transaction import Transaction, TransactionType
from silal_payments.models.user import User, UserType
from random import choice as random_choice, randint
from werkzeug.security import generate_password_hash


# TODO create objects (using faker) of classes then call their insert into db methods to get the SQL
password = "123"
pass_hash = generate_password_hash(
    password, salt_length=8, method="pbkdf2:sha512:200000"
)


admin_1 = User(
    user_id=0,  # auto generated
    phone="1234567890",
    user_type=UserType.manager,
    full_name="Account Manager",
    password_hash=pass_hash,
    email="admin@silal.app",
)

u2 = User(
    user_id=0,  # auto generated
    phone="4343434340",
    user_type=UserType.customer,
    full_name="John Doe",
    password_hash=pass_hash,
    email="123@gmail.com",
)

admin_1.insert_into_db()
u2.insert_into_db()

# generate random transaction data
transactions = []

for i in range(100):
    transaction_type = random_choice(list(TransactionType))
    transaction_amount = randint(1, 1000000) / 100.0
    transaction_date = datetime.now() - timedelta(minutes=randint(1, 60 * 24 * 6))
    transactions.append(
        Transaction(
            transaction_id=0,  # auto generated
            transaction_type=transaction_type,
            transaction_amount=transaction_amount,
            transaction_date=transaction_date,
        )
    )

    transactions[-1].insert_into_db()
