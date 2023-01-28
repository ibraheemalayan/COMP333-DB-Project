from functools import wraps

from flask_login import current_user
from silal_payments.auth.user_loader import unauthorized
from silal_payments.models.user import UserType


def manager_login_required(func):
    @wraps(func)
    def decorated_view(*args, **kwargs):
        if (
            not current_user.is_authenticated
            or current_user.user_type != UserType.manager
        ):
            return unauthorized()
        return func(*args, **kwargs)

    return decorated_view


def driver_login_required(func):
    @wraps(func)
    def decorated_view(*args, **kwargs):
        if (
            not current_user.is_authenticated
            or current_user.user_type != UserType.driver
        ):
            return unauthorized()
        return func(*args, **kwargs)

    return decorated_view
