from lib import assert_eq, v_int, v_string, v_value


def gen_case(case):
    index = v_int(case["input"]["index"])
    return [
        f"str := {v_string(case['input']['string'])}",
        assert_eq(f"{case['property']}(str, {index})", v_value(case["expected"])),
    ]
