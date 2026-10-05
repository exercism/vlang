from lib import assert_error, assert_some, is_error, v_int


def gen_case(case):
    call = f"classify({v_int(case['input']['number'])})"
    expected = case["expected"]
    if is_error(expected):
        return assert_error(call, case)
    return assert_some(call, f"Number.{expected}", f"{call} should not return an error")
