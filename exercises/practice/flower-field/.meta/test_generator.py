from lib import assert_eq, v_array


def gen_case(case):
    garden = v_array(case["input"]["garden"], empty="[]string{}")
    expected = v_array(case["expected"], empty="[]string{}")
    return [
        f"garden := {garden}",
        f"expected := {expected}",
        assert_eq("annotate(garden)", "expected"),
    ]
