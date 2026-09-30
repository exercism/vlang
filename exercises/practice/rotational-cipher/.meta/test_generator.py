from lib import assert_eq, v_int, v_string


def gen_case(case):
    return [
        f"phrase := {v_string(case['input']['text'])}",
        f"shift_key := {v_int(case['input']['shiftKey'])}",
        f"expect := {v_string(case['expected'])}",
        assert_eq("rotate(phrase, shift_key)", "expect"),
    ]
