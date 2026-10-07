from lib import assert_eq, v_string


def gen_case(case):
    value = v_string(case["input"]["value"])
    return assert_eq(f"reverse_string({value})", v_string(case["expected"]))
