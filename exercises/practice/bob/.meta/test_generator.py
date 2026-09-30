from lib import assert_eq, v_string


def gen_case(case):
    hey_bob = v_string(case["input"]["heyBob"])
    return assert_eq(f"response({hey_bob})", v_string(case["expected"]))
