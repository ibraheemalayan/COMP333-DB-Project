from flask import Blueprint, redirect, render_template, url_for

shared_api = Blueprint("shared_api", __name__)


@shared_api.route("/index/", methods=["GET"], subdomain="delivery")
@shared_api.route("/", methods=["GET"], subdomain="delivery")
def delivery_index():
    """index"""

    return render_template("index.html", domain="delivery")


@shared_api.route("/index/", methods=["GET"], subdomain="management")
@shared_api.route("/", methods=["GET"], subdomain="management")
def management_index():
    """index"""

    return redirect(url_for("auth.management_login"))


from . import utils
