from silal_payments.auth.decorators import manager_login_required
from silal_payments.models.transactions.company_driver_transaction import (
    load_transaction_details,
)
from silal_payments.models.users.driver import Driver
from . import management_api
from flask import render_template


@management_api.route(
    "/transaction/company_driver/<int:t_id>/", methods=["GET"], subdomain="management"
)
@manager_login_required
def company_driver_transactions(t_id):
    """transactions details"""

    driver, transaction = load_transaction_details(t_id)

    return render_template(
        "management/transaction_details/company_driver_transaction_details.html",
        transaction=transaction,
        driver=driver,
    )
