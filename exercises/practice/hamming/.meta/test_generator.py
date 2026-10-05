from lib import assert_error, assert_some, is_error, v_int, v_string

ERROR = "lengths must match!"


def gen_case(case):
    strand1 = v_string(case["input"]["strand1"])
    strand2 = v_string(case["input"]["strand2"])
    call = f"distance({strand1}, {strand2})"
    expected = case["expected"]
    if is_error(expected):
        return assert_error(call, {**case, "expected": {"error": ERROR}})
    return assert_some(call, v_int(expected), f"{call} should not return an error")
