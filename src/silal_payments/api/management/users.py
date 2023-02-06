from typing import List
from flask import url_for, redirect, render_template
from sympy import Product

from silal_payments.auth.decorators import manager_login_required
from silal_payments.models.users.seller import Seller
from silal_payments.models.users.driver import Driver
from silal_payments.utils.queries import getAllSellersData, getSellersData, list_drivers_with_balance, DriverData, getSellerProducts
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


@management_api.route("/sellers/<int:seller_id>/", methods=["GET"], subdomain="management")
@manager_login_required
def seller_details(seller_id):
    """order details"""

    products: List[Product] = getSellerProducts(seller_id)
    seller = getSellersData(seller_id)
    return render_template(
        "management/seller_details.html",
        products=products,
        seller = seller
    )
