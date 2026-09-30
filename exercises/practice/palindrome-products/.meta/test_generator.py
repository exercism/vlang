from lib import INDENT, assert_eq, assert_error, is_error, v_int, v_value


def gen_case(case):
    prop = case["property"]
    expected = case["expected"]
    call = f"{prop}({v_int(case['input']['min'])}, {v_int(case['input']['max'])})"
    if is_error(expected):
        return assert_error(call, case, f"if min more than max, {prop}")
    value = "none" if expected["value"] is None else v_int(expected["value"])
    return [
        "expected := Palindrome{",
        f"{INDENT}value: {value}",
        f"{INDENT}factors: {v_value(expected['factors'])}",
        "}",
        assert_eq(f"{call}!", "expected"),
    ]
