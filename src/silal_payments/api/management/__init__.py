from flask import Blueprint

management_api = Blueprint("management_api", __name__, subdomain="management")

from . import users
