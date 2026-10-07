from lib import assert_eq, v_string


def gen_case(case):
    return assert_eq("hello()", v_string(case["expected"]))
