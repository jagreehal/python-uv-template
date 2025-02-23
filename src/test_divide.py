import pytest

from .divide import DivideParams, DivisionError, divide


def test_divide_two_numbers() -> None:
    result = divide(DivideParams(dividend=10, divisor=2))
    assert result == 5


def test_division_by_zero() -> None:
    with pytest.raises(DivisionError) as exc_info:
        divide(DivideParams(dividend=10, divisor=0))
    assert exc_info.value.dividend == 10
    assert exc_info.value.divisor == 0
    assert exc_info.value.message == "Cannot divide by zero"
    assert exc_info.value.details == {"dividend": 10, "divisor": 0}


def test_divide_negative_numbers() -> None:
    result = divide(DivideParams(dividend=-10, divisor=2))
    assert result == -5


def test_fractional_results() -> None:
    result = divide(DivideParams(dividend=10, divisor=3))
    assert result == pytest.approx(3.333333333333333)
