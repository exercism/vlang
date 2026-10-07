from lib import assert_false, assert_true, v_string


def gen_case(case):
    call = f"is_valid({v_string(case['input']['isbn'])})"
    return assert_true(call) if case["expected"] else assert_false(call)
