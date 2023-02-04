from sqlalchemy import text
from silal_payments import db
from sqlalchemy.engine import Result, Row

class Product:
    def __init__(self, product_id: int, product_name: str, product_price: int, product_seller: id) -> None:
        self.product_id: int = product_id
        self.product_name: str = product_name
        self.product_price: int = product_price
        self.product_seller: id = product_seller
    
    def insert_into_db(self) -> int:
        product_id: Row = db.session.execute(
            text(
                f"""INSERT INTO public.product (product_name, product_price, product_seller) VALUES (:product_name, :product_price, :product_seller) RETURNING product_id""",
            ).bindparams(
                product_name=self.product_name,
                product_price=self.product_price,
                product_seller=self.product_seller,
            ),
        ).first()
        db.session.commit()
        self.product_id = product_id[0]
        return self.product_id

    def __str__(self) -> str:
        return f"""Product: product_id={self.product_id} product_name={self.product_name} product_price={self.product_price} product_seller={self.product_seller}"""