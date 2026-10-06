from lib import assert_error, assert_true, is_error, v_float, v_string

HEADER = """import math

fn close_enough(a f64, b f64) bool {
\treturn math.abs(a - b) < 0.01
}"""


def gen_case(case):
    call = f"age({case['input']['seconds']}, {v_string(case['input']['planet'])})"
    if is_error(case["expected"]):
        return assert_error(call, case, check_message=False)
    return assert_true(f"close_enough({call}!, {v_float(case['expected'])})")
