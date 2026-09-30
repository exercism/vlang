from lib import assert_eq, v_inline_array, v_string


def gen_case(case):
    colors = v_inline_array(case["input"]["colors"])
    expected = f"{case['expected']['value']} {case['expected']['unit']}"
    return assert_eq(f"label({colors})", v_string(expected))
