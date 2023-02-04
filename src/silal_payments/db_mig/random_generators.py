from datetime import datetime, timedelta
from silal_payments import db
from silal_payments.models.order import Order
from silal_payments.models.order_item import OrderItem
from silal_payments.models.transactions.transaction import Transaction, TransactionType
from silal_payments.models.transactions.company_driver_transaction import (
    CompanyDriverTransaction,
)
from silal_payments.models.transactions.customer_company_transaction import (
    CustomerCompanyTransaction,
)
from silal_payments.models.transactions.customer_driver_transaction import (
    CustomerDriverTransaction,
)
from silal_payments.models.transactions.driver_company_transaction import (
    DriverCompanyTransaction,
)
from silal_payments.models.transactions.seller_company_transaction import (
    SellerCompanyTransaction,
)
from silal_payments.models.users.customer import Customer
from silal_payments.models.users.seller import Seller
from silal_payments.models.users.driver import Driver
from silal_payments.models.users.user import User, UserType
from silal_payments.models.product import Product
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

carriers = ["97252", "97253", "97254", "97256",
            "97258", "97259", "97056", "97059"]


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


def insert_random_sellers(num_sellers: int):
    """Insert a random number of sellers into the database"""

    # generate random seller data
    sellers = []
    fake: Faker = Faker()
    Faker.seed(0)
    for i in range(num_sellers):
        phone = get_random_il_e164()
        full_name = fake.name()
        password = "123"
        pass_hash = generate_password_hash(
            password, salt_length=8, method="pbkdf2:sha512:200000"
        )
        email = fake.email()
        sellers.append(
            Seller(
                user_id=0,  # auto generated
                phone=phone,
                full_name=full_name,
                password_hash=pass_hash,
                email=email,
                bank_account=str(fake.credit_card_number()[0:16]),
            )
        )

        sellers[-1].insert_into_db()

    return sellers


def insert_random_drivers(num_drivers: int):
    # generate random driver data
    drivers = []
    fake: Faker = Faker()
    Faker.seed(0)
    for i in range(num_drivers):
        phone = get_random_il_e164()
        full_name = fake.name()
        password = "123"
        pass_hash = generate_password_hash(
            password, salt_length=8, method="pbkdf2:sha512:200000"
        )
        email = fake.email()
        drivers.append(
            Driver(
                user_id=0,  # auto generated
                phone=phone,
                full_name=full_name,
                password_hash=pass_hash,
                email=email,
                bank_account=str(fake.credit_card_number()[0:16]),
            )
        )

        drivers[-1].insert_into_db()

    return drivers


def insert_random_transactions(
    num_transactions: int,
    customers: list[Customer],
    sellers: list[Seller],
    drivers: list[Driver],
):
    """Insert a random number of transactions into the database"""

    # generate random transaction data
    transactions = []
    for i in range(num_transactions):
        transaction_type = random_choice(list(TransactionType))
        transaction_amount = randint(1, 1000000) / 100.0
        transaction_date = datetime.now() - timedelta(minutes=randint(1, 60 * 24 * 6))
        if transaction_type == TransactionType.company_driver_transaction:
            transactions.append(
                CompanyDriverTransaction(
                    transaction_id=0,  # auto generated
                    transaction_amount=transaction_amount,
                    transaction_date=transaction_date,
                    driver_id=random_choice(drivers).user_id,
                )
            )
        elif transaction_type == TransactionType.customer_company_transaction:
            transactions.append(
                CustomerCompanyTransaction(
                    transaction_id=0,  # auto generated
                    transaction_amount=transaction_amount,
                    transaction_date=transaction_date,
                    customer_id=random_choice(customers).user_id,
                )
            )
        elif transaction_type == TransactionType.customer_driver_transaction:
            transactions.append(
                CustomerDriverTransaction(
                    transaction_id=0,  # auto generated
                    transaction_amount=transaction_amount,
                    transaction_date=transaction_date,
                    customer_id=random_choice(customers).user_id,
                    driver_id=random_choice(drivers).user_id,
                )
            )
        elif transaction_type == TransactionType.driver_company_transaction:
            transactions.append(
                DriverCompanyTransaction(
                    transaction_id=0,  # auto generated
                    transaction_amount=transaction_amount,
                    transaction_date=transaction_date,
                    driver_id=random_choice(drivers).user_id,
                )
            )
        elif transaction_type == TransactionType.seller_company_transaction:
            transactions.append(
                SellerCompanyTransaction(
                    transaction_id=0,  # auto generated
                    transaction_amount=transaction_amount,
                    transaction_date=transaction_date,
                    seller_id=random_choice(sellers).user_id,
                )
            )

        transactions[-1].insert_into_db()
    return transactions


def insert_random_products(num_products: int, sellers: list[Seller]):
    """Insert a random number of products into the database"""

    # generate random product data
    products = []
    fake: Faker = Faker()
    Faker.seed(0)
    for _ in range(num_products):
        name = fake.name()
        price = randint(1, 1000000) / 100.0
        products.append(
            Product(
                product_id=0,  # auto generated
                product_name=name,
                product_price=price,
                product_seller=random_choice(sellers).user_id,
            )
        )

        products[-1].insert_into_db()
    return products


def insert_random_orders(
    num_orders: int,
    customers: list[Customer],
    drivers: list[Driver],
):
    """Insert a random number of orders into the database"""

    # generate random order data
    orders = []
    for _ in range(num_orders):
        orders.append(Order(
            order_id=0, # auto generated
            order_customer=random_choice(customers).user_id,
            order_driver=random_choice(drivers).user_id,
            order_status = "Potato",
        ))
        orders[-1].insert_into_db()
    return orders

def insert_random_order_items(
    num_order_items: int,
    orders: list[Order],
    products: list[Product],
):
    """Insert a random number of order items into the database"""

    # generate random order item data
    order_items = []
    for _ in range(num_order_items):
        order_items.append(OrderItem(
            order_item_id=0, # auto generated
            order_item_order=random_choice(orders).order_id,
            order_item_product=random_choice(products).product_id,
            order_item_quantity=randint(1, 100),
        ))
        order_items[-1].insert_into_db()
    return order_items
