from .random_generators import (
    insert_random_customers,
    insert_random_order_items,
    insert_random_orders,
    insert_random_transactions,
    insert_random_sellers,
    insert_random_drivers,
    insert_random_products,
)
from datetime import datetime, timedelta
from silal_payments import db
from silal_payments.models.transactions.transaction import Transaction, TransactionType
from silal_payments.models.users.customer import Customer
from silal_payments.models.users.user import UserType
from silal_payments.models.users.manager import Manager

from random import choice as random_choice, randint
from werkzeug.security import generate_password_hash

from alive_progress import alive_bar, config_handler
from colorama import Fore, Style

with alive_bar(
    16, title=Fore.CYAN + "Mock Data" + Fore.LIGHTYELLOW_EX, bar="blocks"
) as bar:
    print("Filling defaults and fake data")

    # TODO create objects (using faker) of classes then call their insert into db methods to get the SQL
    password = "123"
    pass_hash = generate_password_hash(
        password, salt_length=8, method="pbkdf2:sha512:200000"
    )
    bar()

    admin_1 = Manager(
        user_id=0,  # auto generated
        phone="1234567890",
        full_name="Account Manager",
        password_hash=pass_hash,
        email="admin@silal.app",
    )

    admin_1.insert_into_db()
    bar()

    sellers = insert_random_sellers(15)
    bar()
    bar()
    products = insert_random_products(30, sellers)
    bar()
    bar()
    bar()
    customers = insert_random_customers(20)
    bar()
    bar()
    drivers = insert_random_drivers(10)
    bar()
    orders = insert_random_orders(30, customers, drivers)
    bar()
    bar()
    bar()
    order_items = insert_random_order_items(orders, products)
    bar()
    transactions = insert_random_transactions(30, customers, sellers, drivers, orders)
    bar()
    bar()
