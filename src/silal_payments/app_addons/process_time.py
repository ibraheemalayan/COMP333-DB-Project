from flask import request, Flask
from datetime import datetime


def attach_process_time_calculator(app: Flask):

    app.logger.debug("Enabling Process Time Counter for API Requests")

    @app.before_request
    def record_request_processing_start_time():
        request.start_time = datetime.now().timestamp()

    @app.after_request
    def record_request_processing_end_time_and_add_header(response):

        process_time = (
            datetime.now().timestamp() - request.start_time
        ) * 1000  # milliseconds

        response.headers["X-Process-Time"] = process_time

        return response
