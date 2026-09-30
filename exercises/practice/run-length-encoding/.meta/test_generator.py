from lib import assert_eq, v_string
from lib import nested_test_name as test_name  # noqa: F401


def gen_case(case):
    prop = case["property"]
    lines = [f"message := {v_string(case['input']['string'])}"]
    if prop == "consistency":
        lines.append(assert_eq("decode(encode(message))", "message"))
    else:
        lines.append(f"{prop}d := {v_string(case['expected'])}")
        lines.append(assert_eq(f"{prop}(message)", f"{prop}d"))
    return lines
