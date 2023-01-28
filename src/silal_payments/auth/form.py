from wtforms.fields import BooleanField, PasswordField, SubmitField, EmailField
from wtforms.validators import InputRequired, Email, Length
from flask_wtf.form import FlaskForm


# ##############################################
# ##### Forms
# ##############################################


class EmailPassLoginForm(FlaskForm):
    """email-password form"""

    email = EmailField("Email", validators=[InputRequired(), Length(1, 64), Email()])
    password = PasswordField("Password", validators=[InputRequired()])
    remember_me = BooleanField("Keep me logged in")
    submit = SubmitField("Log In")
