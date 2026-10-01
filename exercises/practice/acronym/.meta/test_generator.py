from lib import assert_eq, v_string


def gen_case(case):
    return [
        f"phrase := {v_string(case['input']['phrase'])}",
        assert_eq("abbreviate(phrase)", v_string(case["expected"])),
    ]
