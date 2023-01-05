from flask import Blueprint, render_template

index_api = Blueprint("index_api", __name__)


@index_api.route("/index/", methods=["GET"], subdomain="delivery")
@index_api.route("/", methods=["GET"], subdomain="delivery")
@index_api.route("/index/", methods=["GET"], subdomain="management")
@index_api.route("/", methods=["GET"], subdomain="management")
def index():
    """index"""

    return render_template("index.html")
