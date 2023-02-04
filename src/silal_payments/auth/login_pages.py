from . import auth_bp
from .form import EmailPassLoginForm
from flask import render_template, flash


@auth_bp.route("/login/", subdomain="management")
def management_login():
    form = EmailPassLoginForm()

    return render_template("auth/login.html", form=form)


@auth_bp.route("/login/", subdomain="delivery")
def delivery_login():
    form = EmailPassLoginForm()

    return render_template("auth/delivery_login.html", form=form)


# @auth_bp.route("/login/", subdomain="seller")
# def seller_login():

#     form = EmailPassLoginForm()

#     return render_template("auth/seller_login.html", form=form)


# @auth.route("/login/", subdomain="www")
# def customer_login():
#     form = EmailPassLoginForm()
#     return render_template("auth/login/customer_login.html", form=form)
