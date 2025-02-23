import pytest

from divide import DivideParams, DivisionError, divide


def test_divide_two_numbers():
    result = divide(DivideParams(dividend=10, divisor=2))
    assert result == 5


def test_division_by_zero():
    with pytest.raises(DivisionError) as exc_info:
        divide(DivideParams(dividend=10, divisor=0))

    assert str(exc_info.value) == "Cannot divide by zero"
    assert exc_info.value.dividend == 10
    assert exc_info.value.divisor == 0
    assert exc_info.value.details == {"dividend": 10, "divisor": 0}


def test_divide_negative_numbers():
    result = divide(DivideParams(dividend=-10, divisor=2))
    assert result == -5


def test_fractional_results():
    result = divide(DivideParams(dividend=10, divisor=3))
    assert round(result, 4) == 3.3333
