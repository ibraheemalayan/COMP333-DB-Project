from flask import request, Response, current_app, Flask
from flask_cors import CORS


def allow_cors_for_api(app: Flask):

    app.logger.debug("Enabling CORS for API")

    @app.before_request
    def allow_cross_origin():
        """Allow cross-origin requests."""

        if request.method == "OPTIONS" and request.path.startswith("/api/"):

            response: Response = current_app.response_class(
                status=int(200),
                mimetype="application/json",
            )

            response.headers["Allow"] = "GET,POST,PUT,DELETE,OPTIONS,HEAD"
            response.headers["Access-Control-Allow-Origin"] = "*"
            response.headers[
                "Access-Control-Allow-Headers"
            ] = "Content-Type,Authorization,Debug,Accept,X-Requested-With"
            response.headers[
                "Access-Control-Allow-Methods"
            ] = "GET,POST,PUT,DELETE,OPTIONS,HEAD"

            return response

    CORS(app, send_wildcard=True)
