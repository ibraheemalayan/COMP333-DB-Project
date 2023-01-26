from flask import (
    Blueprint,
    Flask,
    Response,
    render_template,
    request,
    redirect,
    url_for,
    session,
    flash,
)
from flask_sqlalchemy import SQLAlchemy


app = Flask(__name__)

db = SQLAlchemy(app)

bp = Blueprint("test_bp", __name__, url_prefix="/test/", subdomain="test")


@bp.route("/test")
def i():
    return "hi"


@app.route("/", methods=["POST", "GET"])
def index():

    if request.method == "GET":

        names = ["John", "Peter", "Paul", "Mary"]

        return render_template("index.html", names=names)

    res = Response("OK")

    res.headers["Content-Type"] = "text/plain"
    res.status_code = 200

    return res


@app.route("/hello")
def hello():

    html = "<h1>HELLO 123</h1>"

    res = Response(html)

    res.headers["Content-Type"] = "text/html"
    res.status_code = 200

    return res


if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=5600)
