from silal_payments.auth.decorators import manager_login_required
from silal_payments.utils.queries import (
    company_profit,
    delete_product,
    get_order_count,
    getMonthlyProfit,
    get_product_count,
)
from . import management_api
from flask import flash, redirect, render_template, url_for
from silal_payments.models.transactions.transaction import (
    Transaction,
    load_transactions_from_db,
)


@management_api.route("/", methods=["GET"], subdomain="management")
@management_api.route("/home/", methods=["GET"], subdomain="management")
@manager_login_required
def home():
    """index"""

    return render_template(
        "management/home.html",
        number_of_orders=get_order_count(),
        profit_per_month_list=getMonthlyProfit(),
        total_profit=company_profit(),
        number_of_products=get_product_count(),
    )


@management_api.route(
    "/products/delete/<int:p_id>", methods=["GET"], subdomain="management"
)
@manager_login_required
def delete_product_api(p_id):
    """delete product"""

    try:
        delete_product(product_id=p_id)

    except KeyError as e:
        flash("Product not found", "danger")
        return redirect(url_for("management_api.home"))

    except ValueError as e:
        flash("Product has orders, and cannot be deleted", "danger")
        return redirect(url_for("management_api.home"))

    flash("Product deleted", "success")
    return redirect(url_for("management_api.home"))
