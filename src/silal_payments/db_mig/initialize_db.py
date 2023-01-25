from silal_payments import db


db.engine.execute("CREATE TABLE test;")

# read sql commands from file (inti_db.sql) and execute them
file = open("init_db.sql", "r")

for line in file:
    db.engine.execute(line)
