from flask import url_for, redirect, render_template
from . import delivery_api


#  TODO : delivery endpoints


@delivery_api.route("/index/", methods=["GET"], subdomain="delivery")
@delivery_api.route("/", methods=["GET"], subdomain="delivery")
def delivery_index():
    """index"""

    return "Welcome Driver"
