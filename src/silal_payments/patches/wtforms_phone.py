from flask import flash
from wtforms import Field

from phonenumbers import is_valid_number, parse, PhoneNumberFormat, format_number
from phonenumbers.phonenumberutil import NumberParseException


class PhoneNumberField(Field):
    """
    custom wtforms-field used for phone numbers
    """

    def __init__(self, label=None, validators=None, **kwargs):
        super().__init__(label, validators, **kwargs)

    def validate_number(self, phone):

        if phone is None:
            return

        p = None

        try:
            p = parse(str(phone).strip())
            if not is_valid_number(p):
                raise ValueError()
        except (NumberParseException, ValueError):
            flash("Invalid phone number", "error")
            raise ValueError("Invalid phone number")

        self.data = format_number(p, PhoneNumberFormat.INTERNATIONAL)

    def process_formdata(self, valuelist):

        super().process_formdata(valuelist=valuelist)

        if valuelist is list and len(valuelist) > 0:
            self.validate_number(valuelist[0])

        self.validate_number(valuelist[0])

    def process_data(self, value):

        super().process_data(value=value)

        self.validate_number(value)
