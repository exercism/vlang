from lib import assert_eq, v_string


def gen_case(case):
    return [
        f"phrase := {v_string(case['input']['phrase'])}",
        f"expect := {v_string(case['expected'])}",
        assert_eq(f"{case['property']}(phrase)", "expect"),
    ]
