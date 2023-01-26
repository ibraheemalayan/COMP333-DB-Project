from decimal import Decimal
import logging
import os
from datetime import timedelta

basedir = os.path.abspath(os.path.dirname(__file__))

verbose_logs = False


class Config:

    DEBUG = False

    CONFIG_MODE = "raw"

    # FIXME deepcode ignore HardcodedNonCryptoSecret: <TODO>
    SECRET_KEY = 'V"*asfjdfyia;ochbsluiyurfhdcbals"-p'  # TODO regenerate

    SERVER_NAME = "silal-payments.com:9999"
    DOMAIN_NAME = "silal-payments.com"

    SSL_REDIRECT = True
    SQLALCHEMY_DATABASE_URI = (
        "postgresql+psycopg2://silal_payment:PasSw0rd@127.0.0.1:5432/"
    )
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    SQLALCHEMY_RECORD_QUERIES = False

    # ######## Cookies & Tokens ########

    # Session

    SESSION_COOKIE_DOMAIN = False
    SESSION_COOKIE_NAME = "TODO"  # TODO
    SESSION_COOKIE_HTTPONLY = True
    SESSION_COOKIE_SECURE = False
    SESSION_COOKIE_SAMESITE = "lax"

    # Remember me

    REMEMBER_COOKIE_DOMAIN = None
    REMEMBER_COOKIE_NAME = "TODO remember me"  # TODO
    REMEMBER_COOKIE_SECURE = True  # restricts remember me to HTTPS
    REMEMBER_COOKIE_DURATION = int(timedelta(days=90).total_seconds())

    TEMP_BEARER_DURATION = int(timedelta(minutes=15).total_seconds())

    FRESH_LOGIN_TIMEOUT_MINUTES = (
        86400  # TODO FIXME set this to a reasonable value ( 15 minutes )
    )

    # TODO investigate how this disables the whole remember me functionlity
    # REMEMBER_COOKIE_REFRESH_EACH_REQUEST = True

    REMEMBER_COOKIE_HTTPONLY = (
        True  # disallow client-side extentions, scripts from accessing the cookie
    )

    WTF_CSRF_ENABLED = False

    # Pagination
    PER_PAGE = 50

    DELIVERY_PRICE = Decimal(10.0)

    @staticmethod
    def init_app(app):
        pass


class DevelopmentConfig(Config):

    DEBUG = True

    CONFIG_MODE = "development"

    REMEMBER_COOKIE_SECURE = False

    REMEMBER_COOKIE_NAME = "remember"
    SESSION_COOKIE_NAME = "session"

    EMAIL_OTP_LIFE_IN_SECONDS = 600  # 10 minutes
    SMS_OTP_LIFE_IN_SECONDS = 240  # 4 minute

    DEBUG = True
    SSL_REDIRECT = False
    WTF_CSRF_ENABLED = False

    SQLALCHEMY_RECORD_QUERIES = True
    SQLALCHEMY_TRACK_MODIFICATIONS = True
    # SQLALCHEMY_ECHO=True

    # SQLite config

    # SQLALCHEMY_DATABASE_URI = os.environ.get(
    #     "DEV_DATABASE_URL"
    # ) or "sqlite:///" + os.path.join(os.path.dirname(basedir), "data-dev.sqlite")

    # Postgresql config

    SQLALCHEMY_DATABASE_URI = (
        os.environ.get("DEV_DATABASE_URL")
        or "postgresql+psycopg2://silal_payment:PasSw0rd@127.0.0.1:5432/"
    )

    # SQLALCHEMY_DATABASE_URI = os.environ.get("REMOTE_DEV_DATABASE_URL")

    SOLR_HOST = "localhost"
    SOLR_PORT = 8983
    SOLR_LISTING_CORE = "silal_listings_core"
    SOLR_IMAGES_CORE = "silal_images_core"
    SOLR_STORES_CORE = "silal_stores_core"
    SOLR_HOST_PROTOCOL = "http"

    # AWS S3 images bucket (local dev bucket)

    # deepcode ignore HardcodedNonCryptoSecret: <#FIXME>
    AWS_S3_UPLOADED_OBJECT_UPLOADER_ACCESS_KEY = "AKIA4ZWUIHLNE3I7K2NE"
    AWS_S3_UPLOADED_OBJECT_UPLOADER_SECRET_KEY = (
        "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"
    )

    AWS_S3_UPLOADED_OBJECT_BUCKET_REGION = "eu-central-1"

    AWS_S3_UPLOADED_OBJECT_BUCKET = "local-silal-image-store"

    DEFAULT_DESIRED_CARRIERS_PER_SHIFT = 3

    @staticmethod
    def init_app(app):

        app.logger.setLevel(logging.INFO)

        # from silal.app_addons.sentry_filters import filter_client_errors

        # sentry_sdk.init(
        #     dsn=DevelopmentConfig.SENTRY_DSN,
        #     integrations=[
        #         FlaskIntegration(),
        #     ],
        #     release=DevelopmentConfig.VERSION,
        #     environment=DevelopmentConfig.CONFIG_MODE,
        #     request_bodies="always",
        #     before_send=filter_client_errors,
        #     traces_sample_rate=1.0,
        # )

        app.logger.debug("Loaded DevelopmentConfig, Disabled Sentry")


class RemoteDevelopmentConfig(DevelopmentConfig):

    # TODO FIXME

    CONFIG_MODE = "remote_development"

    SOLR_HOST = "search.dev.silal.app"
    SOLR_PORT = 8983
    # SOLR_LISTING_CORE = "silal_listings_core"
    SOLR_HOST_PROTOCOL = "https"

    REDIS_HOST = "18.198.6.151"  # FIXME replace with DNS hostname in production
    REDIS_PORT = "8105"
    REDIS_BACKEND_DB = "6"

    # TODO FIXME secure + least privilage prniciple + TLS certificates + seperate staging/dev from production
    REDIS_PASSWORD = None
    REDIS_USERNAME = None

    SERVER_NAME = "dev.silal.app"
    DOMAIN_NAME = "dev.silal.app"

    SQLALCHEMY_DATABASE_URI = os.environ.get("REMOTE_DEV_DATABASE_URL")
    SSL_REDIRECT = False

    REDIRECT_URI = "https://www." + SERVER_NAME + "/auth/oauth2/google/callback"

    # AWS S3 images bucket (remote dev bucket)

    # deepcode ignore HardcodedNonCryptoSecret: <#FIXME>
    AWS_S3_UPLOADED_OBJECT_UPLOADER_ACCESS_KEY = "AKIA4ZWUIHLNCHF3XAUU"
    AWS_S3_UPLOADED_OBJECT_UPLOADER_SECRET_KEY = (
        "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"
    )

    AWS_S3_UPLOADED_OBJECT_BUCKET_REGION = "eu-central-1"

    AWS_S3_UPLOADED_OBJECT_BUCKET = "development-image-store-silal"

    @classmethod
    def init_app(cls, app):

        app.logger.setLevel(logging.INFO)

        # TODO add handler for mail or slack that sends errors to the right place
        # TODO add handlers that log that a server has started up with config ### and version ### at time ### ( log to somwhere like slack )
        # TODO enhance access log to log IPs, user agent, etc.
        # TODO use sentry for error reporting

        app.logger.debug("RemoteDevelopmentConfig was loaded")

        gunicorn_error_logger = logging.getLogger("gunicorn.error")
        app.logger.handlers.extend(gunicorn_error_logger.handlers)

        gunicorn_access_logger = logging.getLogger("gunicorn.access")
        app.logger.handlers.extend(gunicorn_access_logger.handlers)


config_modes: dict[str, Config] = {
    "development": DevelopmentConfig,
    "remote_development": RemoteDevelopmentConfig,
    # "aws_dev": AWSManagerDevelopmentConfig,
    # "production": ProductionConfig,
    # "testing": TestingConfig,
    "raw": Config,
}
