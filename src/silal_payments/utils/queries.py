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
    def __init__(self, product, seller_name, quantity, order_price):
        self.product: Product = product
        self.seller_name: str = seller_name
        self.quantity: int = quantity
        self.order_price: float = order_price
    def __str__(self):
        return f"""Item: product={self.product.__str__()} seller={self.seller_name} quantity={self.quantity}, Order-Price: {self.order_price},  total={self.total()}"""

    def total(self):
        return self.order_price * self.quantity


def showOrderProducts(order_id):
    result = db.session.execute(text(
        f"""	
	select pr.*, u.full_name, oi.quantity, oi.price_per_unit
	FROM 
	public.product pr JOIN public.order_item oi 
	ON oi.product_id = pr.product_id 
	JOIN public.seller s 
	ON pr.product_seller = s.user_id
	JOIN public.user u
	on u.user_id = s.user_id
    WHERE oi.order_id = :oid
    """
    ).bindparams(oid=order_id))
    Items = []
    for row in result:
        Items.append(Item(Product(product_id=row[0], product_name=row[1],
                     product_price=row[2], product_seller=row[3]), row[4], row[5], row[6]))
    return Items