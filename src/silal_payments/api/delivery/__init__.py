from flask import Blueprint

delivery_api = Blueprint("delivery_api", __name__, subdomain="delivery")

from . import index
