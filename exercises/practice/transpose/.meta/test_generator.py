from lib import assert_eq, v_array, v_string


def gen_case(case):
    lines = v_array(case["input"]["lines"], v_string, empty="[]string{}")
    expect = v_array(case["expected"], v_string, empty="[]string{}")
    return [
        f"lines := {lines}",
        f"expect := {expect}",
        assert_eq("transpose(lines)", "expect"),
    ]
