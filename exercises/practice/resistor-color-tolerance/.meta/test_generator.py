from lib import assert_eq, v_inline_array, v_string


def gen_case(case):
    colors = v_inline_array(case["input"]["colors"])
    expected = case["expected"]
    label = f"{expected['value']} {expected['unit']}"
    if "tolerance" in expected:
        label += f" {expected['tolerance']}"
    return assert_eq(f"label({colors})", v_string(label))
