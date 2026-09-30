from lib import assert_false, assert_true, v_string


def gen_case(case):
    check = assert_true if case["expected"] else assert_false
    return check(f"is_paired({v_string(case['input']['value'])})")
