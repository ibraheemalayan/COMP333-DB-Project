from .. import login_manager


@login_manager.user_loader
def load_user_by_id(user_id):

    from ..models.user import User, load_user_from_db

    return load_user_from_db(user_id)
