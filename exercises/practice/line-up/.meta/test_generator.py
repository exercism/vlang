from lib import assert_eq, v_int, v_string


def gen_case(case):
    name = v_string(case["input"]["name"])
    number = v_int(case["input"]["number"])
    return assert_eq(f"format({name}, {number})", v_string(case["expected"]))
