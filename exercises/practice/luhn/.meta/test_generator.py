from lib import assert_false, assert_true, v_string


def gen_case(case):
    call = f"valid({v_string(case['input']['value'])})"
    return assert_true(call) if case["expected"] else assert_false(call)
