from silal_payments.auth.decorators import manager_login_required
from . import management_api
from flask import render_template
from silal_payments.models.transactions.transaction import (
    Transaction,
    load_transactions_from_db,
)


@management_api.route("/", methods=["GET"], subdomain="management")
@management_api.route("/home/", methods=["GET"], subdomain="management")
@manager_login_required
def home():
    """index"""

    return render_template("management/home.html")
