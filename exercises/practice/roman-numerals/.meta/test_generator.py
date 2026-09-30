from lib import assert_eq, v_int, v_string


def gen_case(case):
    number = v_int(case["input"]["number"])
    return assert_eq(f"roman({number})", v_string(case["expected"]))
