from lib import assert_eq, v_int


def sort_key(case):
    return case["input"]["radicand"]


def gen_case(case):
    radicand = v_int(case["input"]["radicand"])
    return assert_eq(f"square_root({radicand})", v_int(case["expected"]))
