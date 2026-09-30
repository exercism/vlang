from lib import assert_eq, v_inline_array, v_string, v_text


def gen_case(case):
    strings = v_inline_array(case["input"]["strings"], empty="[]string{}")
    expected = v_text(case["expected"]) if case["expected"] else v_string("")
    return [
        f"strings := {strings}",
        f"expected := {expected}",
        assert_eq("recite(strings)", "expected"),
    ]
