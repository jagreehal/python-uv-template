from typing import Dict, Optional, Union

from pydantic import BaseModel, Field


class ErrorDetails(BaseModel):
    code: str
    message: str
    details: Optional[Dict[str, float]] = None


class Success(BaseModel):
    success: bool = Field(default=True)
    data: float


class Failure(BaseModel):
    success: bool = Field(default=False)
    error: ErrorDetails


Result = Union[Success, Failure]
