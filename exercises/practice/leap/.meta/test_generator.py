from lib import assert_false, assert_true


def gen_case(case):
    call = f"is_leap_year({case['input']['year']})"
    return assert_true(call) if case["expected"] else assert_false(call)
