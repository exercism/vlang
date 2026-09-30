from lib import assert_eq, assert_error, is_error, v_inline_array, v_string


def gen_case(case):
    call = f"proteins({v_string(case['input']['strand'])})"
    if is_error(case["expected"]):
        return assert_error(call, case)
    return assert_eq(f"{call}!", v_inline_array(case["expected"]))
