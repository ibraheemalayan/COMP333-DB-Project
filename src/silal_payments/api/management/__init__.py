from flask import Blueprint

management_api = Blueprint("management_api", __name__, subdomain="management")

from . import users, admin, orders, transactions, add_transaction
