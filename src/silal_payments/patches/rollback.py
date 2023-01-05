from flask import request, Response, current_app, Flask
from flask_cors import CORS
from flask_sqlalchemy import SQLAlchemy


def set_rollback_on_exception_teardown(app: Flask, db: SQLAlchemy):

    app.logger.debug("Enabling Rollback on teardown if exception is raised")

    @app.teardown_request
    def teardown_request(exception):
        if exception:
            db.session.rollback()

        # db.session.remove() # TODO FIXME check if this is needed and its performance impact
