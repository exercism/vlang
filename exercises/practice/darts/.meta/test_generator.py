from lib import assert_eq, v_float, v_int


def gen_case(case):
    x = v_float(case["input"]["x"])
    y = v_float(case["input"]["y"])
    return assert_eq(f"score({x}, {y})", v_int(case["expected"]))
