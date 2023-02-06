from typing import List
from flask import url_for, redirect, render_template

from silal_payments.auth.decorators import manager_login_required
from silal_payments.models.product import Product
from silal_payments.models.users.seller import Seller
from silal_payments.models.users.driver import Driver, select_company_driver_transactions
from silal_payments.utils.queries import (
    get_driver_balance,
    get_driver_orders,
    get_seller_orders_items,
    getAllSellersData,
    getSellersData,
    list_drivers_with_balance,
    DriverData,
    getSellerProducts,
    seller_company_transactions_filter,
)
from . import management_api
from silal_payments.models.users.user import User


@management_api.route(
    "/user_profile/<int:user_id>/", methods=["GET"], subdomain="management"
)
@manager_login_required
def get_user_by_id(user_id: int):
    """index"""

    user: User = User.load_by_id(user_id=user_id)

    if user is None:
        return redirect(url_for("shared_api.not_found"))

    return render_template("user_profile.html", user=user)


@management_api.route("/sellers/", methods=["GET"], subdomain="management")
@manager_login_required
def sellers_list_page():
    """orders table"""

    sellers: List[Seller] = getAllSellersData()

    return render_template("management/sellers.html", sellers=sellers)


@management_api.route("/drivers/", methods=["GET"], subdomain="management")
@manager_login_required
def drivers_list_page():
    """orders table"""

    drivers: List[DriverData] = list_drivers_with_balance()

    return render_template("management/drivers.html", drivers=drivers)


@management_api.route(
    "/sellers/<int:seller_id>/", methods=["GET"], subdomain="management"
)
@manager_login_required
def seller_details(seller_id):
    """seller details"""

    products: List[Product] = getSellerProducts(seller_id)
    seller = getSellersData(seller_id)
    order_items = get_seller_orders_items(seller_id)
    transactions =  seller_company_transactions_filter(seller_id)
    return render_template(
        "management/seller_details.html", products=products, seller=seller, order_items=order_items, transactions=transactions
    )


@management_api.route(
    "/drivers/<int:driver_id>/", methods=["GET"], subdomain="management"
)
@manager_login_required
def driver_details(driver_id):
    """order details"""
    driver = get_driver_balance(driver_id)
    transactions = select_company_driver_transactions(driver_id)
    orders = get_driver_orders(driver_id)
    print(driver.balance)
    return render_template(
        "management/driver_details.html", driver=driver, transactions=transactions, orders=orders
    )
