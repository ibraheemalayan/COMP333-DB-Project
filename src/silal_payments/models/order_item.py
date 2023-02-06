from sqlalchemy import text
from silal_payments import db
from sqlalchemy.engine import Result, Row


class OrderItem:
    def __init__(
        self, order_id: int, product_id: int, quantity: int, price_per_unit: int
    ) -> None:
        self.order_id: int = order_id
        self.product_id: int = product_id
        self.quantity: int = quantity
        self.price_per_unit: float = price_per_unit

    def insert_into_db(self) -> int:
        order_item_id: Row = db.session.execute(
            text(
                f"""INSERT INTO public.order_item (order_id, product_id, quantity, price_per_unit) VALUES (:order_id, :product_id, :quantity, :price_per_unit) RETURNING product_id, order_id""",
            ).bindparams(
                order_id=self.order_id,
                product_id=self.product_id,
                quantity=self.quantity,
                price_per_unit=self.price_per_unit,
            ),
        ).first()
        db.session.commit()

        self.product_id = order_item_id[0]
        self.order_id = order_item_id[1]
        return (self.product_id, self.order_id)

    def load_from_db():
        result = db.session.execute(
            text(f"""SELECT * FROM public.order_item""")
        )

        order_items = [
            OrderItem(
                order_id=row[0],
                product_id=row[1],
                quantity=row[2],
                price_per_unit=row[3],
            )
            for row in result
        ]
        return order_items

    def __str__(self):
        return f"""OrderItem: order_id={self.order_id} product_id={self.product_id} quantity={self.quantity} price_per_unit={self.price_per_unit}"""
