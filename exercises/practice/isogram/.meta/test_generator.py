from lib import assert_false, assert_true, v_string


def gen_case(case):
    call = f"is_isogram({v_string(case['input']['phrase'])})"
    return assert_true(call) if case["expected"] else assert_false(call)
