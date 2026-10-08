from lib import assert_eq, v_array, v_inline_array, v_int


def gen_box(value):
    if value is None:
        return "None{}"
    if isinstance(value, list):
        return f"Many[int]{{\nboxes: {v_array(value, gen_box)}\n}}"
    return f"One[int]{{\nvalue: {v_int(value)}\n}}"


def gen_case(case):
    return [
        f"box := {gen_box(case['input']['array'])}",
        assert_eq("flatten[int](box)", v_inline_array(case["expected"])),
    ]
