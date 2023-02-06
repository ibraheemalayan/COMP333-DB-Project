from flask import Blueprint, current_app
from sqlalchemy import text
from silal_payments.models.product import Product
from silal_payments.models.transactions.company_driver_transaction import (
    CompanyDriverTransaction,
    load_company_driver_transaction_from_db,
    load_transaction_details,
)
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


@cli_bp.cli.command("test-company-driver-transaction")
def test_t():

    info = load_transaction_details(transaction_id=26)
    print("_" * 20)
    print(info[0])
    print("_" * 20)
    print(info[1])


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
