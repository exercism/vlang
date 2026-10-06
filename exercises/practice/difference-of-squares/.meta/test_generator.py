from lib import assert_eq

FUNCTIONS = {
    "squareOfSum": "square_of_sum",
    "sumOfSquares": "sum_of_squares",
    "differenceOfSquares": "difference",
}


def gen_case(case):
    function = FUNCTIONS[case["property"]]
    return assert_eq(f"{function}({case['input']['number']})", str(case["expected"]))
