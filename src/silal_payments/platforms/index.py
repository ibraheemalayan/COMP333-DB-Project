from flask import Blueprint, render_template

index_api = Blueprint("index_api", __name__)


@index_api.route("/index/", methods=["GET"], subdomain="delivery")
@index_api.route("/", methods=["GET"], subdomain="delivery")
def delivery_index():
    """index"""

    return render_template("index.html", domain="delivery")


@index_api.route("/index/", methods=["GET"], subdomain="management")
@index_api.route("/", methods=["GET"], subdomain="management")
def management_index():
    """index"""

    return render_template("index.html", domain="management")
