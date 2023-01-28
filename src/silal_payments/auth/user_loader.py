from .. import login_manager
from flask import flash, redirect, url_for, request


@login_manager.user_loader
def load_user_by_id(user_id):

    from ..models.user import User, load_user_from_db

    return load_user_from_db(user_id)


@login_manager.unauthorized_handler
def unauthorized():

    flash("Please login to access this page", category="error")

    if request.host.startswith("management."):

        return redirect(url_for("auth.management_login"))

    if request.host.startswith("delivery."):

        return redirect(url_for("auth.delivery_login"))

    return redirect("/page_not_found/")
