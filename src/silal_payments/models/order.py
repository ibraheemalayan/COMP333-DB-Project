from sqlalchemy import text
from silal_payments import db
from sqlalchemy.engine import Result, Row
class Order:
    def __init__(self, order_id: int, order_customer: int, order_driver: int, order_status: str, ) -> None:
        self.order_id: int = order_id
        self.order_customer: int = order_customer
        self.order_driver: int = order_driver
        self.order_status: str = order_status
    def insert_into_db(self) -> int:
        order_id: Row = db.session.execute(
            text(
                f"""INSERT INTO public.order (order_customer, order_driver, order_status) VALUES (:order_customer, :order_driver, :order_status) RETURNING order_id""",
            ).bindparams(
                order_customer=self.order_customer,
                order_driver=self.order_driver,
                order_status=self.order_status,
            ),
        ).first()
        db.session.commit()
        self.order_id = order_id[0]
        return self.order_id
    
    def __str__(self) -> str:
        return f"""Order: order_id={self.order_id} order_customer={self.order_customer} order_driver={self.order_driver} order_status={self.order_status}"""