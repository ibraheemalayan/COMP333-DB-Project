from flask import send_from_directory
from . import shared_api
import os


@shared_api.route("/static/<path:path>", subdomain="delivery")
@shared_api.route("/static/<path:path>", subdomain="management")
def send_static_file(path):
    return send_from_directory(os.path.join("templates", "static"), path)
