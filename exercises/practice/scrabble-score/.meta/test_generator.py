from lib import assert_eq, v_string


def gen_case(case):
    word = v_string(case["input"]["word"])
    return assert_eq(f"score({word})", str(case["expected"]))
