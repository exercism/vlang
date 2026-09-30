from lib import assert_eq, v_int


def gen_case(case):
    number = v_int(case["input"]["number"])
    return assert_eq(f"egg_count({number})", v_int(case["expected"]))
