from datetime import datetime
from flask import flash, redirect, render_template, request, url_for
from flask_wtf.form import FlaskForm
from wtforms.fields import RadioField, SubmitField, StringField, TextAreaField
from wtforms.validators import InputRequired, Email, Length
from wtforms.fields.numeric import DecimalField
from silal_payments.models.transactions.company_driver_transaction import (
    CompanyDriverTransaction,
)
from silal_payments.models.transactions.seller_company_transaction import (
    SellerCompanyTransaction,
)

from silal_payments import db
from silal_payments.models.users.user import User

from . import management_api

from silal_payments.models.transactions.transaction import TransactionType
from silal_payments.patches.wtforms_integers import PostgresIntegerField


class NewTransactionForm(FlaskForm):
    """fill seller email form"""

    user_id = PostgresIntegerField("User ID", validators=[InputRequired()])
    transaction_type = RadioField(
        "User Type",
        validators=[InputRequired()],
        choices=[
            (TransactionType.company_driver_transaction.value, "Driver"),
            (TransactionType.seller_company_transaction.value, "Seller"),
        ],
    )
    amount = DecimalField(
        "Amount",
        validators=[InputRequired()],
        places=2,
    )
    submit = SubmitField()  # the label text will be added later


@management_api.route("/new_transaction/", methods=["GET"], subdomain="management")
def new_transaction():
    """API that handles the transaction form   [TESTED]"""

    user_id = request.args.get("user_id", default=0, type=int)
    t_type = request.args.get("t_type", default=0, type=int)

    form: NewTransactionForm = NewTransactionForm()

    if user_id != 0:
        form.user_id.default = user_id

    if t_type != 0:
        form.transaction_type.default = (
            TransactionType.company_driver_transaction.value
            if t_type == 1
            else TransactionType.seller_company_transaction.value
        )

    form.process()

    return render_template("management/form.html", form=form, title="New Transaction")


@management_api.route(
    "/new_transaction_submission/", methods=["POST"], subdomain="management"
)
def submit_management_login():
    """API that handles the transaction form submission   [TESTED]"""

    form: NewTransactionForm = NewTransactionForm()

    if form.validate():
        user: User = User.load_by_id(form.user_id.data)

        t_type = TransactionType(int(form.transaction_type.data))

        if user is None or user.user_type != t_type:
            flash("User with this Type, ID was not found", category="error")
            return redirect(url_for("management_api.new_transaction"))

        if t_type == TransactionType.company_driver_transaction:
            transaction = CompanyDriverTransaction(
                transaction_id=0,  # autoincrement
                transaction_amount=form.amount.data,
                transaction_date=datetime.now(),
                driver_id=user.user_id,
            )

            transaction.insert_into_db()
        elif t_type == TransactionType.seller_company_transaction:
            transaction = SellerCompanyTransaction(
                transaction_id=0,  # autoincrement
                transaction_amount=form.amount.data,
                transaction_date=datetime.now(),
                seller_id=user.user_id,
            )

            transaction.insert_into_db()

        db.session.commit()

        flash("Transaction was created", category="success")
        return redirect(url_for("management_api.home"))

    flash("Invalid Form Data", category="error")
    return redirect(url_for("management_api.new_transaction"))
