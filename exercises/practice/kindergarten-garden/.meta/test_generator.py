from lib import assert_eq, v_string, v_value
from lib import nested_test_name as test_name  # noqa: F401


def gen_case(case):
    student = v_string(case["input"]["student"])
    return [
        f"diagram := {v_string(case['input']['diagram'])}",
        f"expect := {v_value(case['expected'])}",
        assert_eq(f"plants(diagram, {student})", "expect"),
    ]
