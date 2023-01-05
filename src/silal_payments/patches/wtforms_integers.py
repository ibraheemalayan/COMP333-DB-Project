from typing import List
from wtforms import IntegerField
from wtforms.validators import NumberRange


class PostgresIntegerField(IntegerField):
    """
    add a validator that prevents number out of range errors for Postgresql integer type
    """

    RANGE_MIN = -2147483648
    RANGE_MAX = 2147483647

    def __init__(self, label=None, validators=None, **kwargs):
        super().__init__(label, validators, **kwargs)

    def validate_range(self):

        if self.data is not None:

            try:
                assert self.data > self.RANGE_MIN and self.data < self.RANGE_MAX
            except AssertionError as exc:
                raise ValueError(
                    self.gettext(
                        f"Value is not in the integer range [{self.RANGE_MIN}, {self.RANGE_MAX}]"
                    )
                ) from exc

    def process_formdata(self, valuelist):

        super().process_formdata(valuelist=valuelist)

        self.validate_range()

    def process_data(self, value):

        super().process_data(value=value)

        self.validate_range()


class PostgresBigIntegerField(PostgresIntegerField):
    """
    add a validator that prevents number out of range errors for Postgresql integer type
    """

    RANGE_MIN = -9223372036854775808
    RANGE_MAX = 9223372036854775807
