from pydantic import BaseModel


class DivisionError(Exception):
    """Custom exception for division errors with additional context."""
    def __init__(self, dividend: float, divisor: float, message: str):
        self.dividend = dividend
        self.divisor = divisor
        self.message = message
        self.details = {"dividend": dividend, "divisor": divisor}
        super().__init__(message)


class DivideParams(BaseModel):
    dividend: float
    divisor: float


def divide(params: DivideParams) -> float:
    """Divide two numbers.
    
    Args:
        params: DivideParams containing dividend and divisor
        
    Returns:
        float: Result of division
        
    Raises:
        DivisionError: If divisor is zero
    """
    if params.divisor == 0:
        raise DivisionError(
            dividend=params.dividend,
            divisor=params.divisor,
            message="Cannot divide by zero"
        )
    
    return params.dividend / params.divisor
