from silal_payments.auth.decorators import manager_login_required
from silal_payments.models.transactions.company_driver_transaction import (
    load_company_driver_transaction_details,
)
from silal_payments.models.transactions.customer_company_transaction import (
    load_customer_company_transaction_details,
)
from silal_payments.models.transactions.transaction import (
    TransactionType,
    load_transactions_from_db,
)
from silal_payments.models.transactions.seller_company_transaction import (
    load_seller_company_transactions_details
)
from silal_payments.models.transactions.driver_company_transaction import (
    load_driver_company_transaction_details
)
from silal_payments.models.transactions.customer_driver_transaction import (
    load_customer_driver_transaction_details
)
from silal_payments.models.users.driver import Driver
from . import management_api
from flask import render_template


@management_api.route("/transactions/", methods=["GET"], subdomain="management")
@manager_login_required
def transactions():
    """list transactions"""

    transactions: list[TransactionType] = load_transactions_from_db()

    transaction_types_bs_classes = {
        "customer_driver_transaction": "success",
        "customer_company_transaction": "danger",
        "company_driver_transaction": "primary",
        "seller_company_transaction": "secondary",
        "driver_company_transaction": "info",
    }

    transaction_link_prefix = {
        "customer_driver_transaction": "customer_driver",
        "customer_company_transaction": "customer_company",
        "company_driver_transaction": "company_driver",
        "seller_company_transaction": "seller_company",
        "driver_company_transaction": "driver_company",
    }

    return render_template(
        "management/transaction_list.html",
        transactions=transactions,
        transaction_types_bs_classes=transaction_types_bs_classes,
        transaction_link_prefix=transaction_link_prefix,
    )


@management_api.route(
    "/transaction/company_driver/<int:t_id>/", methods=["GET"], subdomain="management"
)
@manager_login_required
def company_driver_transactions(t_id):
    """transactions details"""

    driver, transaction = load_company_driver_transaction_details(t_id)

    return render_template(
        "management/transaction_details/company_driver_transaction_details.html",
        transaction=transaction,
        driver=driver,
    )


@management_api.route(
    "/transaction/customer_company/<int:t_id>/", methods=["GET"], subdomain="management"
)
@manager_login_required
def customer_company_transactions(t_id):
    """transactions details"""

    customer, transaction = load_customer_company_transaction_details(t_id)

    return render_template(
        "management/transaction_details/customer_company_transaction_details.html",
        transaction=transaction,
        customer=customer,
    )


@management_api.route(
    "/transaction/driver_company/<int:t_id>/", methods=["GET"], subdomain="management"
)
@manager_login_required
def driver_company_transactions(t_id):
    """Transactions Details"""

    driver, transaction = load_driver_company_transaction_details(t_id)

    return render_template(
        "management/transaction_details/driver_company_transaction_details.html",
        transaction=transaction,
        driver=driver,
    )

@management_api.route(
    "/transaction/seller_company/<int:t_id>/", methods=["GET"], subdomain="management"
)
@manager_login_required
def seller_company_transactions(t_id):
    """Transactions Details"""

    seller, transaction = load_seller_company_transactions_details(t_id)

    return render_template(
        "management/transaction_details/seller_company_transaction_details.html",
        transaction=transaction,
        seller=seller,
    )

@management_api.route(
    "/transaction/customer_driver/<int:t_id>/", methods=["GET"], subdomain="management"
)
@manager_login_required
def customer_driver_transactions(t_id):
    """Transactions Details"""

    customer, driver, transaction = load_customer_driver_transaction_details(t_id)

    return render_template(
        "management/transaction_details/customer_driver_transaction_details.html",
        transaction=transaction,
        customer=customer,
        driver=driver
    )
