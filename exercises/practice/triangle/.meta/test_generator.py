from lib import assert_false, assert_true, v_value
from lib import nested_test_name as test_name  # noqa: F401


def gen_case(case):
    sides = ", ".join(v_value(side) for side in case["input"]["sides"])
    call = f"is_{case['property']}({sides})"
    return assert_true(call) if case["expected"] else assert_false(call)
