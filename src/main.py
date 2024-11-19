from divide import DivideParams, divide

if __name__ == "__main__":
    result = divide(DivideParams(dividend=10, divisor=2))
    print(result)
    result = divide(DivideParams(dividend=10, divisor=0))
    print(result)
    result = divide(DivideParams(dividend=-10, divisor=2))
    print(result)
    result = divide(DivideParams(dividend=10, divisor=3))
    print(result)
