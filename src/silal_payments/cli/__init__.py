from flask import Blueprint, current_app
from sqlalchemy import text
from silal_payments.models.product import Product
from silal_payments.models.transactions.seller_company_transaction import (
    load_seller_company_transactions_details,
)
from silal_payments.models.users.driver import select_company_driver_transactions
from silal_payments.utils.queries import *

from datetime import datetime


cli_bp = Blueprint("cli", __name__)


@cli_bp.cli.command("init-db")
def init_db():
    from silal_payments.db_mig import initialize_db


@cli_bp.cli.command("db-fill")
def init_db():
    from silal_payments.db_mig import fill_defaults_and_fake


@cli_bp.cli.command("test-products")
def test():
    for product in Product.load_products_from_db():
        print(product)


@cli_bp.cli.command("test-transaction")
def test_t():

    info = load_seller_company_transactions_details(transaction_id=44)
    print("_" * 20)
    print(info[0])
    print("_" * 20)
    print(info[1])


@cli_bp.cli.command("show_order_products")
def test():
    from silal_payments.models.order import Order

    for order in Order.load_from_db():
        print(order)
        for item in showOrderProducts(order.order_id):
            print(item)


@cli_bp.cli.command("show_seller_data")
def test():
    from silal_payments.models.users.seller import Seller

    print(getSellersData(Seller.load_by_id(2).user_id))


@cli_bp.cli.command("show_monthly_profit")
def test():
    print(getMonthlyProfit())


@cli_bp.cli.command("test_drivers_balance")
def test():
    drivers = list_drivers_with_balance()
    for driver in drivers:
        print(driver)


@cli_bp.cli.command("test-company-profit")
def test():
    profit = company_profit()
    print(profit)


@cli_bp.cli.command("test-orders-number")
def test():
    count = get_order_count()
    print(count)


@cli_bp.cli.command("test-seller-orders-items")
def test():
    order_items = get_seller_orders_items(seller_id=3)
    for order_item in order_items:
        print(order_item)


@cli_bp.cli.command("test-seller-company-transactions-filter")
def test():
    transactions = seller_company_transactions_filter(seller_id=3)
    for transaction in transactions:
        print(transaction)


@cli_bp.cli.command("test-update-product-price")
def test():
    update_product_price(product_id=1, new_price=16.50)


@cli_bp.cli.command("test-delete-product")
def test():
    delete_product(product_id=1)


@cli_bp.cli.command("test-get-driver-orders")
def test():
    orders = get_driver_orders(driver_id=44)
    for order in orders:
        print(order)


@cli_bp.cli.command("test-get-driver-transactions")
def test():
    transactions = select_company_driver_transactions(driver_id=44)
    for transaction in transactions:
        print(transaction)


@cli_bp.cli.command("drop-db")
def drop_db():
    print("\n❕ Dropping Database ...")

    from silal_payments import db

    # db.drop_all()
    # db.session.commit()

    # TODO for each table, drop it

    db.session.execute(text("DROP TABLE IF EXISTS alembic_version;"))

    from sqlalchemy.ext.compiler import compiles

    print("\n✅ Database was dropped successfully\n")


@cli_bp.cli.command("init-db-w-sample-data")
# def init_db_with_sample_data():
#     from silal.db_mig import initialize_db
#     from silal.db_mig import fake_fill_db
# TODO Never make this runnable in production
@cli_bp.cli.command("reset-db-w-sample-data")
def init_db_with_sample_data():
    if not current_app.debug:
        raise Exception("Seriously !")

    print("\n❕ Reseting Database ...")

    from silal_payments import db

    # db.drop_all()
    # db.session.commit()

    # TODO for each table, drop it

    db.session.execute(text("DROP TABLE IF EXISTS alembic_version;"))

    print("✅ Database was droped successfully")

    from silal_payments.db_mig import initialize_db
    from silal_payments.db_mig import fill_defaults_and_fake
