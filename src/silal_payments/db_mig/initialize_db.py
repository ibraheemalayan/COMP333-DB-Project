from silal_payments import db
from sqlalchemy import text
import os

# read sql commands from file (inti_db.sql) and execute them
file = open(os.path.join(".", "silal_payments", "db_mig", "reset_db.sql"), "r")


sql = file.read()


db.session.execute(text(sql))
