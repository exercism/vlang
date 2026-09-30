from lib import assert_eq, v_int, v_string


def gen_case(case):
    prop = case["property"]
    rails = v_int(case["input"]["rails"])
    return [
        f"message := {v_string(case['input']['msg'])}",
        f"{prop}d := {v_string(case['expected'])}",
        assert_eq(f"{prop}(message, {rails})", f"{prop}d"),
    ]
