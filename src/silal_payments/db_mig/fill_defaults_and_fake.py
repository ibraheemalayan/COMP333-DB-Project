from silal_payments import db
from silal_payments.models.user import User, UserType
from werkzeug.security import check_password_hash, generate_password_hash


# TODO create objects (using faker) of classes then call their insert into db methods to get the SQL
password = "123"
pass_hash = generate_password_hash(
    password, salt_length=8, method="pbkdf2:sha512:200000"
)


u1 = User(
    user_id=1,
    phone="1234567890",
    user_type=UserType.customer,
    full_name="John Doe",
    password_hash=pass_hash,
    email="random@gmail.com",
)

u2 = User(
    user_id=1,
    phone="1234567890",
    user_type=UserType.customer,
    full_name="John Doe",
    password_hash=pass_hash,
    email="123@gmail.com",
)

u1.insert_into_db()
u2.insert_into_db()
