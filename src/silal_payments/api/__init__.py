from flask import Blueprint, redirect, render_template, url_for

from silal_payments.auth.decorators import driver_login_required

shared_api = Blueprint("shared_api", __name__)

from . import utils
