from lib import assert_eq, v_string


def gen_case(case):
    phrase = v_string(case["input"]["phrase"])
    return assert_eq(f"truncate({phrase})", v_string(case["expected"]))
