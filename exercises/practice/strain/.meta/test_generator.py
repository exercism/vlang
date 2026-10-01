import re

from lib import assert_eq, v_array, v_value

HEADER = "const empty = []int{cap: 0}"


def v_type(value):
    if isinstance(value, list):
        return "[]" + v_type(value[0])
    return "string" if isinstance(value, str) else "int"


def v_list(values):
    nested = isinstance(values[0], list)
    return v_array(values) if nested else v_value(values)


def gen_case(case):
    values = case["input"]["list"]
    element = v_type(values[0]) if values else "int"
    body = case["input"]["predicate"].removeprefix("fn(x) -> ")
    body = re.sub(r"(\w+)\((\w+), ", r"\2.\1(", body)
    lines = []
    if values:
        lines.append(f"array := {v_list(values)}")
    lines.append(f"predicate := fn (x {element}) bool {{\n\treturn {body}\n}}")
    if case["expected"]:
        lines.append(f"expect := {v_list(case['expected'])}")
    actual = f"{case['property']}({'array' if values else 'empty'}, predicate)"
    lines.append(assert_eq(actual, "expect" if case["expected"] else "empty"))
    return lines
