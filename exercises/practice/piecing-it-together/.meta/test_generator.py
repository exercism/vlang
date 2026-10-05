import re

from lib import assert_error, assert_some, is_error, v_value


def v_struct(name, fields):
    names = [re.sub(r"[A-Z]", r"_\g<0>", key).lower() + ":" for key in fields]
    width = max(map(len, names))
    lines = [
        f"\t{name.ljust(width)} {v_value(value)}"
        for name, value in zip(names, fields.values())
    ]
    return "\n".join([f"{name}{{", *lines, "}"])


def gen_case(case):
    call = "jigsaw_data(puzzle)"
    expected = case["expected"]
    lines = [f"puzzle := {v_struct('PartialInformation', case['input'])}"]
    if is_error(expected):
        lines.append(assert_error(call, case))
    else:
        lines.append(f"expect := {v_struct('FullInformation', expected)}")
        lines.append(assert_some(call, "expect", f"{call} should not return an error"))
    return lines
