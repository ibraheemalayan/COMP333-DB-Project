from sqlalchemy import text
from silal_payments import db
from sqlalchemy.engine import Result, Row
from silal_payments.models.product import Product
from silal_payments.models.order import Order
from silal_payments.models.order_item import OrderItem
from silal_payments.models.users.user import User
from silal_payments.models.users.seller import Seller
from silal_payments.models.users.customer import Customer
from silal_payments.models.users.driver import Driver


# define a class for the result


class Item:
    def __init__(self, product, seller_name, quantity, order_price, delivery_fee):
        self.product: Product = product
        self.seller_name: str = seller_name
        self.quantity: int = quantity
        self.order_price: float = order_price
        self.delivery_fee: float = delivery_fee

    def __str__(self):
        return f"""Item: product={self.product.__str__()} seller={self.seller_name} quantity={self.quantity}, Order-Price: {self.order_price},  total={self.total(), self.delivery_fee}"""

    def total(self):
        return self.order_price * self.quantity


def showOrderProducts(order_id):
    result = db.session.execute(
        text(
            f"""
	select pr.*, u.full_name, oi.quantity, oi.price_per_unit, o.delivery_fee
	FROM
	public.product pr JOIN public.order_item oi
	ON oi.product_id = pr.product_id
	JOIN public.seller s
	ON pr.product_seller = s.user_id
	JOIN public.user u
	on u.user_id = s.user_id
    JOIN public.order o
    on o.order_id = oi.order_id
    WHERE oi.order_id = :oid

    """
        ).bindparams(oid=order_id)
    )
    Items = []
    for row in result:
        Items.append(
            Item(
                Product(
                    product_id=row[0],
                    product_name=row[1],
                    product_price=row[2],
                    product_seller=row[3],
                ),
                row[4],
                row[5],
                row[6],
                row[7],
            )
        )
    return Items


def list_drivers_with_balance():
    """list all drivers with balance"""

    stmt = text(
        f"""
        SELECT d.user_id,
               u.full_name,
               d.bank_account,
               s1.Profit,
               s2.Paid
        FROM
          (SELECT order_driver,
                  Sum(delivery_fee) AS Profit
           FROM public.order
           GROUP BY order_driver) AS s1
        JOIN
          (SELECT Sum(transaction_amount) AS Paid,
                  driver_id
           FROM company_driver_transaction
           INNER JOIN public.transaction ON company_driver_transaction.transaction_id=public.transaction.transaction_id
           GROUP BY driver_id) AS s2 ON s2.driver_id = s1.order_driver
        RIGHT JOIN public.driver AS d ON d.user_id = s2.driver_id
        LEFT JOIN public.user AS u ON u.user_id = d.user_id
        ORDER BY d.user_id

        """
    )

    result = db.session.execute(stmt)

    for row in result:
        print(row)


def getSellersData(sellerId: int):
    result = db.session.execute(
        text(
            f"""
    select  sum(oi.quantity * oi.price_per_unit), s.bank_account, u.*
	FROM
	public.product pr JOIN public.order_item oi
	ON oi.product_id = pr.product_id
	JOIN public.seller s
	ON pr.product_seller = s.user_id
	JOIN public.user u
	ON u.user_id = s.user_id
	where u.user_id = :sid
	group by u.user_id, s.user_id
        """
        ).bindparams(sid=sellerId)
    ).first()
    return Seller(
        user_id=result[2],
        phone=result[3],
        full_name=result[4],
        email=result[7],
        bank_account=result[1],
        balance=result[0],
        password_hash=None,
    )


def getAllSellersData():
    result = db.session.execute(
        text(
            f"""
    select  sum(oi.quantity * oi.price_per_unit), s.bank_account, u.*
	FROM
	public.product pr JOIN public.order_item oi
	ON oi.product_id = pr.product_id
	JOIN public.seller s
	ON pr.product_seller = s.user_id
	JOIN public.user u
	ON u.user_id = s.user_id
	group by u.user_id, s.user_id
        """
        )
    )
    sellers = []
    for row in result:
        sellers.append(
            Seller(
                user_id=row[2],
                phone=row[3],
                full_name=row[4],
                email=row[7],
                bank_account=row[1],
                balance=row[0],
                password_hash=None,
            )
        )
    return sellers
