from .. import login_manager


@login_manager.user_loader
def load_user_by_id(useR_id):
    # from .models import User

    # return User.query.get(useR_id)
    pass
