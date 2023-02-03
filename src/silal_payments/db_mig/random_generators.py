from datetime import datetime, timedelta
from silal_payments import db
from silal_payments.models.transaction import Transaction, TransactionType
from silal_payments.models.users.customer import Customer
from silal_payments.models.users.user import User, UserType
from faker import Faker
from random import choice as random_choice, randint
from werkzeug.security import generate_password_hash

from random import choice, randint

# 97252|Cellcom
# 97253|Hot Mobile
# 97254|Orange
# 97256|Wataniya
# 97258|Golan Telecom
# 97259|Jawwal
# 97056|Ooredoo Group
# 97059|Palestine Cellular Communications

carriers = ["97252", "97253", "97254", "97256", "97258", "97259", "97056", "97059"]


def get_random_il_e164() -> str:

    return "+" + choice(carriers) + "{0:07d}".format(randint(0, 9999999))


def insert_random_customers(num_customers: int):
    """Insert a random number of customers into the database"""

    # generate random customer data
    customers = []
    fake: Faker = Faker()
    Faker.seed(0)
    for i in range(num_customers):
        phone = get_random_il_e164()
        full_name = fake.name()
        password = "123"
        pass_hash = generate_password_hash(
            password, salt_length=8, method="pbkdf2:sha512:200000"
        )
        email = fake.email()
        address = fake.address()
        card_number = fake.credit_card_number()[0:16]
        customers.append(
            Customer(
                user_id=0,  # auto generated
                phone=phone,
                full_name=full_name,
                password_hash=pass_hash,
                email=email,
                address=address,
                card_number=card_number,
            )
        )

        customers[-1].insert_into_db()

    return customers


def insert_random_transactions(num_transactions: int):
    """Insert a random number of transactions into the database"""

    # generate random transaction data
    transactions = []

    for i in range(num_transactions):
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
