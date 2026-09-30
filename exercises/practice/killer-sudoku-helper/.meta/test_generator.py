from lib import assert_eq, v_value


def gen_case(case):
    cage = case["input"]["cage"]
    args = ", ".join(v_value(cage[key]) for key in ("sum", "size", "exclude"))
    return [
        f"expect := {v_value(case['expected'])}",
        assert_eq(f"combinations({args})", "expect"),
    ]
