import logging
from os import environ

from flask import Flask, request
from flask_bootstrap import Bootstrap4  # TODO change to Bootstrap5
from flask_login import LoginManager
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime

from silal_payments.app_addons.process_time import attach_process_time_calculator
from silal_payments.patches.cross_origin import allow_cors_for_api
from silal_payments.patches.rollback import set_rollback_on_exception_teardown

from .configs import (
    Config,
    config_modes,
)
from .patches import wtforms_json

# TODO replace patch with updated version when implemented


#

db: SQLAlchemy = SQLAlchemy()

config_mode = environ.get("MODE") or "development"
config: Config = config_modes[config_mode]

login_manager = LoginManager()

# Show SQL queries
verbose_logs = False


def create_app():

    app = Flask(__name__, subdomain_matching=True)

    app.debug = True

    app.logger.setLevel(logging.INFO)

    # to log SQL queries / Everything loggable
    if verbose_logs:
        logging.basicConfig()
        logging.getLogger("sqlalchemy.engine").setLevel(logging.INFO)  # TODO
        app.logger.setLevel(logging.DEBUG)

    config = config_modes[config_mode]

    app.config.from_object(config)
    config_modes[config_mode].init_app(app)

    # FIXME in production deploy site on same domain or remove this if to allow cors even in production
    if app.debug:
        attach_process_time_calculator(app)
        allow_cors_for_api(app)

    set_rollback_on_exception_teardown(app, db)

    Bootstrap4(app)

    db.init_app(app)

    wtforms_json.init()

    login_manager.init_app(app)

    from .cli import cli_bp as cli_blueprint

    app.register_blueprint(cli_blueprint)

    from werkzeug.middleware.proxy_fix import ProxyFix

    app.wsgi_app = ProxyFix(app.wsgi_app)

    # ########################################################
    # ############ Auth API ############

    from .platforms.index import index_api

    app.register_blueprint(index_api)

    # ########################################################

    # TOREMOVE

    # from .auth import auth as auth_blueprint

    # app.register_blueprint(auth_blueprint, url_prefix="/auth")

    # ########################################################

    # from .util_api import utils_endpoints as utils_blueprint

    # app.register_blueprint(utils_blueprint)

    return app
