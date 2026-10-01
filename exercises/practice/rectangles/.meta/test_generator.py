from lib import assert_eq, v_array, v_int


def gen_case(case):
    strings = v_array(case["input"]["strings"], empty="[]string{}")
    return [
        f"strings := {strings}",
        assert_eq("rectangles(strings)", v_int(case["expected"])),
    ]
