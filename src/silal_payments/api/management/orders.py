from typing import List
from silal_payments.auth.decorators import manager_login_required
from silal_payments.models.order import Order, list_orders
from silal_payments.utils.queries import Item, showOrderProducts
from . import management_api
from flask import render_template


@management_api.route("/orders/", methods=["GET"], subdomain="management")
@manager_login_required
def order_list_page():
    """orders table"""

    orders: List[Order] = list_orders()

    return render_template("management/orders_list.html", orders=orders)


@management_api.route("/order/<int:order_id>/", methods=["GET"], subdomain="management")
@manager_login_required
def order_details(order_id):
    """order details"""

    items: List[Item] = showOrderProducts(order_id)

    order_items_total = sum([item.total() for item in items])

    delivery_fee = items[0].delivery_fee

    return render_template(
        "management/order_details.html",
        items=items,
        order_id=order_id,
        order_items_total=order_items_total,
        delivery_fee=delivery_fee,
    )
