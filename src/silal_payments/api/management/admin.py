from silal_payments.auth.decorators import manager_login_required
from . import management_api
from flask import render_template
from silal_payments.models.transaction import Transaction, load_transactions_from_db


@management_api.route("/", methods=["GET"], subdomain="management")
@management_api.route("/home/", methods=["GET"], subdomain="management")
@manager_login_required
def home():
    """index"""

    return render_template("management/home.html")


@management_api.route("/transactions/", methods=["GET"], subdomain="management")
@manager_login_required
def transactions():
    """list transactions"""

    transactions: list[Transaction] = load_transactions_from_db()

    transaction_types_bs_classes = {
        "customer_driver_transaction": "success",
        "customer_company_transaction": "danger",
        "company_driver_transaction": "primary",
        "company_seller_transaction": "secondary",
        "company_customer_transaction": "info",
    }

    return render_template(
        "management/transaction_list.html",
        transactions=transactions,
        transaction_types_bs_classes=transaction_types_bs_classes,
    )
