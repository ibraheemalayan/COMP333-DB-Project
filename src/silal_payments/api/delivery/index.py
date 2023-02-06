from flask import url_for, redirect, render_template
from flask_login import current_user
from silal_payments.auth.decorators import driver_login_required
from . import delivery_api


#  TODO : delivery endpoints


@delivery_api.route("/index/", methods=["GET"], subdomain="delivery")
@delivery_api.route("/", methods=["GET"], subdomain="delivery")
@driver_login_required
def delivery_index():
    """index"""

    return f"<h1>Welcome {current_user.full_name} </h1>"
