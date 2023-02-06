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
from silal_payments.models.transactions.transaction import Transaction, TransactionType


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


class DriverData:
    def __init__(self, user_id, full_name, email, phone, bank_account, profit, paid):
        self.user_id: int = user_id
        self.full_name: str = full_name
        self.email: str = email
        self.phone: str = phone
        self.bank_account: str = bank_account
        self.profit: float = profit if profit is not None else 0
        self.paid: float = paid if paid is not None else 0
        self.balance: float = self.profit - self.paid


def list_drivers_with_balance():
    """list all drivers with balance"""

    stmt = text(
        f"""
               SELECT d.user_id,
               u.full_name,
               u.email,
               u.phone,
               d.bank_account,
               s1.Profit * 0.6 as driver_revenue,
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
         JOIN public.driver AS d ON d.user_id = s2.driver_id
         JOIN public.user AS u ON u.user_id = d.user_id
        ORDER BY d.user_id
        """
    )

    result = db.session.execute(stmt)
    drivers = []
    for row in result:
        drivers.append(
            DriverData(
                user_id=row[0],
                full_name=row[1],
                email=row[2],
                phone=row[3],
                bank_account=row[4],
                profit=row[5],
                paid=row[6],
            )
        )
    return drivers

def get_driver_balance(driver_id):
    """list all drivers with balance"""

    stmt = text(
        f"""
        SELECT d.user_id,
               u.full_name,
               u.email,
               u.phone,
               d.bank_account,
               s1.Profit * 0.6 as driver_revenue,
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
        WHERE d.user_id = :did

        """
    ).bindparams(did=driver_id)

    row = db.session.execute(stmt).first()
    return DriverData(
                user_id=row[0],
                full_name=row[1],
                email=row[2],
                phone=row[3],
                bank_account=row[4],
                profit=row[5],
                paid=row[6])


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
        full_name=result[5],
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
                full_name=row[5],
                email=row[7],
                bank_account=row[1],
                balance=row[0],
                password_hash=None,
            )
        )
    return sellers


def company_profit():
    """company profits from delivery fees"""

    stmt = text(
        f"""
        Select Sum(delivery_fee) * .4 as company_profit
        from public.order
        """
    )

    result = db.session.execute(stmt).first()

    return result[0]


def getMonthlyProfit():
    result = db.session.execute(
        text(
            f"""
        SELECT
        DATE_TRUNC('month',o.date) as  month,
        sum(o.delivery_fee * 0.4) as profit
        FROM public.order o
        GROUP BY DATE_TRUNC('month',o.date);
        """
        )
    )
    return list((row[0], row[1]) for row in result)  # return a list of tuples


def get_order_count():
    stmt = text(
        f"""
            Select Count(*) as number_of_orders
            from public.order
        """
    )
    result = db.session.execute(stmt).first()
    return result[0]


def get_seller_orders_items(seller_id):
    stmt = text(
        f"""
        SELECT
        pr.product_id,
        pr.product_name,
        pr.product_price,
        oi.quantity,
        oi.price_per_unit,
        oi.order_id
        FROM
        public.product pr JOIN public.order_item oi
        ON oi.product_id = pr.product_id
        WHERE pr.product_seller =:seller_id
        """
    ).bindparams(seller_id=seller_id)

    result = db.session.execute(stmt)
    return list(list(row) for row in result)


def seller_company_transactions_filter(seller_id: int):
    result = db.session.execute(
        text(
            f"""
        SELECT
        t.transaction_id,
        t.transaction_amount,
        t.transaction_date

        FROM
        public.seller_company_transaction ct
        JOIN public.transaction t
        ON t.transaction_id = ct.transaction_id
        WHERE ct.seller_id =:seller_id
        """
        ).bindparams(seller_id=seller_id)
    )
    transaction = []
    for row in result:
        transaction.append(
            Transaction(
                transaction_id=row[0],
                transaction_amount=row[1],
                transaction_date=row[2],
                transaction_type=TransactionType.seller_company_transaction,
            )
        )
    return transaction


def getSellerProducts(seller_id: int):
    result = db.session.execute(
        text(
            f"""
SELECT *
FROM public.product p
JOIN public.seller s
on s.user_id = p.product_seller
where s.user_id = :user_id"""
        ).bindparams(user_id=seller_id)
    )
    products = [
        Product(
            product_id=row[0],
            product_name=row[1],
            product_price=row[2],
            product_seller=row[3],
        )
        for row in result
    ]

    return products


def update_product_price(product_id: int, new_price: float):

    if new_price < 0:
        raise ValueError("Price cannot be negative")

    stmt = text(
        f"""
        UPDATE public.product
        SET product_price = :new_price
        WHERE product_id = :product_id
        RETURNING *
        """
    ).bindparams(product_id=product_id, new_price=new_price)

    result = db.session.execute(stmt).first()
    db.session.commit()

    if result is None:
        raise ValueError("Product not found")


def delete_product(product_id: int):
    stmt0 = text(
        f"""
        SELECT COUNT(*)
        FROM public.order_item
        WHERE product_id = :product_id
        """
    ).bindparams(product_id=product_id)

    result0 = db.session.execute(stmt0).first()
    if result0[0] > 0:
        raise ValueError("Cannot delete product that has been ordered")
    else:
        stmt = text(
            f"""
            DELETE FROM public.product
            WHERE product_id = :product_id
            RETURNING *
            """
        ).bindparams(product_id=product_id)
        result = db.session.execute(stmt).first()
        db.session.commit()
        if result is None:
            raise ValueError("Product not found")


def get_driver_orders(driver_id):
    stmt = text(
        f"""
        SELECT
        o.order_id,
        o.order_date,
        o.delivery_fee
        FROM
        public.order o
        WHERE o.order_driver =:driver_id
        """
    ).bindparams(driver_id=driver_id)
    result = db.session.execute(stmt)
    orders = []
    for row in result:
        orders.append(
            Order(
                order_id=row[0],
                order_date=row[1],
                delivery_fee=row[2],
                order_customer=None,
                order_driver=None,
                order_status=None,
            )
        )
    return orders
