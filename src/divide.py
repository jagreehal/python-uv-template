from pydantic import BaseModel

from result import ErrorDetails, Failure, Result, Success


class DivideParams(BaseModel):
    dividend: float
    divisor: float


def divide(params: DivideParams) -> Result:
    if params.divisor == 0:
        return Failure(
            error=ErrorDetails(
                code="DIVISION_BY_ZERO",
                message="Cannot divide by zero",
                details={"dividend": params.dividend, "divisor": params.divisor},
            )
        )

    return Success(data=params.dividend / params.divisor)
