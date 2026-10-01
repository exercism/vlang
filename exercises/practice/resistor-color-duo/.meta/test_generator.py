from lib import assert_eq, v_inline_array, v_int


def gen_case(case):
    colors = v_inline_array(case["input"]["colors"])
    return assert_eq(f"value({colors})", v_int(case["expected"]))
