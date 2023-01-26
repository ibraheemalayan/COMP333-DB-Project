from silal_payments import db
import os

# read sql commands from file (inti_db.sql) and execute them
file = open(os.path.join(".", "silal_payments", "db_mig", "init_db.sql"), "r")
conn = db.session.connection()

db.session.execute(file.read())
