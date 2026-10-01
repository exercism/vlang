from lib import assert_eq, v_array


def gen_case(case):
    return [
        f"expected := {v_array(case['expected'])}",
        assert_eq(f"rows(`{case['input']['letter']}`)", "expected"),
    ]
