from lib import assert_eq, v_string


def gen_case(case):
    name = v_string(case["input"]["name"] or "")
    return assert_eq(f"two_fer({name})", v_string(case["expected"]))
