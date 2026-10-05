from lib import assert_error, assert_some, is_error, v_inline_array, v_string


def gen_case(case):
    call = f"proteins({v_string(case['input']['strand'])})"
    if is_error(case["expected"]):
        return assert_error(call, case)
    expected = v_inline_array(case["expected"])
    return assert_some(call, expected, f"{call} should not return an error")
