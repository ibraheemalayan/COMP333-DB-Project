import datetime
from sqlalchemy import text
from silal_payments import db
from sqlalchemy.engine import Result, Row


class Order:
    table_name = "order"

    def __init__(
        self,
        order_id: int,
        order_customer: int,
        order_driver: int,
        order_status: str,
        delivery_fee: float,
        order_date,
        total: float = None,
    ) -> None:
        self.order_id: int = order_id
        self.order_customer: int = order_customer
        self.order_driver: int = order_driver
        self.order_status: str = order_status
        self.delivery_fee: float = delivery_fee
        self.total: float = total
        self.order_date = order_date

    def insert_into_db(self) -> int:
        order_id: Row = db.session.execute(
            text(
                f"""INSERT INTO public.order (order_customer, order_driver, order_status, delivery_fee, order_date) VALUES (:order_customer, :order_driver, :order_status, :delivery_fee, :order_date) RETURNING order_id""",
            ).bindparams(
                order_customer=self.order_customer,
                order_driver=self.order_driver,
                order_status=self.order_status,
                delivery_fee=self.delivery_fee,
                order_date=self.order_date,
            ),
        ).first()
        db.session.commit()
        self.order_id = order_id[0]
        return self.order_id

    def __str__(self) -> str:
        return f"Order ID: {self.order_id}, Customer ID: {self.order_customer}, Driver ID: {self.order_driver}, Status: {self.order_status}, Delivery Fee: {self.delivery_fee}"

    def load_total(self) -> float:
        total: Row = db.session.execute(
            text(
                f"""
                SELECT SUM(price_per_unit * quantity), delivery_fee FROM public.order_item
                INNER JOIN public.order
                ON public.order_item.order_id = public.order.order_id
                WHERE public.order.order_id = :order_id
                GROUP BY public.order.order_id
                """,
            ).bindparams(
                order_id=self.order_id,
            ),
        ).first()
        return total[0] + total[1]

    def load_from_db():
        result = db.session.execute(text(f"""SELECT * FROM public.order"""))

        orders = [
            Order(
                order_id=row[0],
                order_customer=row[1],
                order_driver=row[2],
                order_status=row[3],
            )
            for row in result
        ]
        return orders


def list_orders():
    result = db.session.execute(
        text(
            f"""
            SELECT
                public.order.*,
                SUM(price_per_unit * quantity)
            FROM public.order
            JOIN public.order_item
            ON public.order.order_id = public.order_item.order_id
            GROUP BY public.order.order_id, public.order_item.order_id
            ORDER BY public.order.order_id
            """
        )
    )

    orders = [
        Order(
            order_id=row[0],
            order_customer=row[1],
            order_driver=row[2],
            order_status=row[3],
            delivery_fee=row[4],
            order_date=row[5],
            total=row[6],
        )
        for row in result
    ]
    return orders
