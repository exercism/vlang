import re

from lib import assert_eq, assert_error, is_error, v_value


def v_struct(name, fields):
    names = [re.sub(r"[A-Z]", r"_\g<0>", key).lower() + ":" for key in fields]
    width = max(map(len, names))
    lines = [
        f"\t{name.ljust(width)} {v_value(value)}"
        for name, value in zip(names, fields.values())
    ]
    return "\n".join([f"{name}{{", *lines, "}"])


def gen_case(case):
    expected = case["expected"]
    lines = [f"puzzle := {v_struct('PartialInformation', case['input'])}"]
    if is_error(expected):
        lines.append(assert_error("jigsaw_data(puzzle)", case))
    else:
        lines.append(f"expect := {v_struct('FullInformation', expected)}")
        lines.append(assert_eq("jigsaw_data(puzzle)!", "expect"))
    return lines
