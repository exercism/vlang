from lib import assert_false, assert_true


def gen_case(case):
    call = f"is_armstrong_number({case['input']['number']})"
    return assert_true(call) if case["expected"] else assert_false(call)
