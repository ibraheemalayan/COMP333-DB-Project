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
    ) -> None:
        self.order_id: int = order_id
        self.order_customer: int = order_customer
        self.order_driver: int = order_driver
        self.order_status: str = order_status
        self.delivery_fee: float = delivery_fee

    def insert_into_db(self) -> int:
        order_id: Row = db.session.execute(
            text(
                f"""INSERT INTO public.order (order_customer, order_driver, order_status, delivery_fee) VALUES (:order_customer, :order_driver, :order_status, :delivery_fee) RETURNING order_id""",
            ).bindparams(
                order_customer=self.order_customer,
                order_driver=self.order_driver,
                order_status=self.order_status,
                delivery_fee=self.delivery_fee,
            ),
        ).first()
        db.session.commit()
        self.order_id = order_id[0]
        return self.order_id

    def __str__(self) -> str:
        return f"Order ID: {self.order_id}, Customer ID: {self.order_customer}, Driver ID: {self.order_driver}, Status: {self.order_status}, Delivery Fee: {self.delivery_fee}"

    def total(self) -> float:
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
        return total[0]

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
