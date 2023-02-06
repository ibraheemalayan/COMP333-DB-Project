from silal_payments.auth.decorators import manager_login_required
from silal_payments.models.order import Order
from . import management_api
from flask import render_template


@management_api.route("/order/<int:order_id>/", methods=["GET"], subdomain="management")
@manager_login_required
def order_details(order_id):
    """order details"""

    order = Order(order_id, None, None, None)

    return render_template("management/order_details.html", order=order)
