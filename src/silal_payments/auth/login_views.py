# Seller Login
from flask_login import login_user, logout_user, current_user
from silal_payments.auth.form import EmailPassLoginForm
from silal_payments.models.user import UserType, get_user_by_email, User
from werkzeug.security import check_password_hash
from . import auth_bp

from flask import session, url_for, redirect, flash


@auth_bp.route("/login_submission/", methods=["POST"], subdomain="management")
def submit_management_login():
    """API that handles the email/password form submission   [TESTED]"""

    form: EmailPassLoginForm = EmailPassLoginForm()

    if form.validate():

        user: User = get_user_by_email(
            email=form.email.data.lower(), user_type=UserType.manager
        )

        if user is not None and check_password_hash(
            user.password_hash, form.password.data
        ):

            session["remember_user"] = form.remember_me.data

            if not login_user(user, remember=session["remember_user"]):
                flash("Account is inactive", category="error")
                return redirect(url_for("auth.management_login"))

            flash("Logged in successfully", category="success")

            next = None
            if (
                "next" not in session
                or session["next"] is None
                or not session["next"].startswith("/")
            ):
                next = url_for("management_api.home")
            else:
                next = session["next"]
                session.pop("next")
            return redirect(next)

        flash("Invalid Credentials", category="warning")
        return redirect(url_for("auth.management_login"))

    flash("Invalid Form Data", category="error")
    return redirect(url_for("auth.management_login"))


@auth_bp.route("/login_submission/", methods=["POST"], subdomain="delivery")
def submit_delivery_login():
    """API that handles the email/password form submission"""

    form: EmailPassLoginForm = EmailPassLoginForm()

    if form.validate():

        user: User = get_user_by_email(
            email=form.email.data.lower(), user_type=UserType.driver
        )

        if user is not None and check_password_hash(
            user.password_hash, form.password.data
        ):

            session["remember_user"] = form.remember_me.data

            if not login_user(user, remember=session["remember_user"]):
                flash("Account is inactive", category="error")
                return redirect(url_for("auth.delivery_login"))

            flash("Logged in successfully", category="success")

            next = None
            if (
                "next" not in session
                or session["next"] is None
                or not session["next"].startswith("/")
            ):
                next = url_for("delivery_api.home")
            else:
                next = session["next"]
                session.pop("next")
            return redirect(next)

        flash("Invalid Credentials", category="warning")
        return redirect(url_for("auth.delivery_login"))

    flash("Invalid Form Data", category="error")
    return redirect(url_for("auth.delivery_login"))


@auth_bp.route("/logout/", subdomain="management")
def logout_management():
    """Log out"""

    logout_user()

    return redirect(url_for("auth.management_login"))


@auth_bp.route("/logout/", subdomain="delivery")
def logout_driver():
    """Log out"""

    logout_user()

    return redirect(url_for("auth.delivery_login"))
