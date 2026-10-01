import re

from lib import assert_eq, snake_case, v_value
from lib import nested_test_name as test_name  # noqa: F401


def gen_case(case):
    scores = v_value(case["input"]["scores"])
    lines = [f"mut high_scores := HighScores.new({scores})"]
    prop, _, previous = case["property"].partition("After")
    if previous:
        previous = re.sub(r"^(Top|Best)", r"personal\1", previous)
        lines.append(f"high_scores.{snake_case_camel(previous)}()")
    actual = f"high_scores.{snake_case_camel(prop)}()"
    if isinstance(case["expected"], list):
        lines.append(f"expect := {v_value(case['expected'])}")
        lines.append(assert_eq(actual, "expect"))
    else:
        lines.append(assert_eq(actual, v_value(case["expected"])))
    return lines


def snake_case_camel(name):
    return snake_case(re.sub(r"(?<!^)(?=[A-Z])", "_", name))
