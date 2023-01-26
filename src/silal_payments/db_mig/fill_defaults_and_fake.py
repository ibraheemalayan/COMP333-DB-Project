from silal_payments import db


# TODO create objects (using faker) of classes then call their insert into db methods to get the SQL


db.engine.execute(
    f"INSERT INTO public.user (phone, user_type, full_name) VALUES ('920593112323', 'manager', 'random');"
)
