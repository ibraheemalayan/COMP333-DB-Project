from flask import url_for, redirect, render_template
from . import management_api
from silal_payments.models.users.user import User, load_user_from_db


@management_api.route(
    "/user_profile/<int:user_id>/", methods=["GET"], subdomain="management"
)
def get_user_by_id(user_id: int):
    """index"""

    user: User = load_user_from_db(user_id=user_id)

    if user is None:
        return redirect(url_for("shared_api.not_found"))

    return render_template("user_profile.html", user=user)
