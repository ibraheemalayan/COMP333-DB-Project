from flask import send_from_directory, render_template
from . import shared_api
import os


@shared_api.route("/static/<path:path>", subdomain="delivery")
@shared_api.route("/static/<path:path>", subdomain="management")
@shared_api.route("/static/<path:path>", subdomain="www")
def send_static_file(path):
    return send_from_directory(os.path.join("templates", "static"), path)


@shared_api.route("/page_not_found/", methods=["GET"], subdomain="management")
@shared_api.route("/page_not_found/", methods=["GET"], subdomain="delivery")
@shared_api.route("/page_not_found/", methods=["GET"], subdomain="www")
def page_not_found(e):
    """handler for 404"""

    return render_template("404.html"), 404
