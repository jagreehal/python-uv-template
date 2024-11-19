from divide import DivideParams, divide
from result import Failure, Success


def test_divide_two_numbers():
    result = divide(DivideParams(dividend=10, divisor=2))
    assert isinstance(result, Success)
    assert result.success is True
    assert result.data == 5


def test_division_by_zero():
    result = divide(DivideParams(dividend=10, divisor=0))
    assert isinstance(result, Failure)
    assert result.success is False
    assert result.error.code == "DIVISION_BY_ZERO"
    assert result.error.message == "Cannot divide by zero"
    assert result.error.details == {"dividend": 10, "divisor": 0}


def test_divide_negative_numbers():
    result = divide(DivideParams(dividend=-10, divisor=2))
    assert isinstance(result, Success)
    assert result.success is True
    assert result.data == -5


def test_fractional_results():
    result = divide(DivideParams(dividend=10, divisor=3))
    assert isinstance(result, Success)
    assert result.success is True
    assert round(result.data, 4) == 3.3333
