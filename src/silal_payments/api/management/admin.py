from . import management_api
from flask import render_template
from flask_login import login_required


@management_api.route("/")
@management_api.route("/home/", methods=["GET"], subdomain="management")
@login_required
def home():
    """index"""

    return render_template("management/home.html")
