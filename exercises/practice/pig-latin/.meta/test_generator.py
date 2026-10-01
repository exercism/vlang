from lib import assert_eq, v_string
from lib import nested_test_name as test_name  # noqa: F401


def gen_case(case):
    phrase = v_string(case["input"]["phrase"])
    return assert_eq(f"translate({phrase})", v_string(case["expected"]))
