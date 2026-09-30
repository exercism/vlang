from lib import assert_eq, v_array, v_string


def gen_case(case):
    minefield = v_array(case["input"]["minefield"], v_string, empty="[]string{}")
    expected = v_array(case["expected"], v_string, empty="[]string{}")
    return [
        f"minefield := {minefield}",
        f"expected := {expected}",
        assert_eq("annotate(minefield)", "expected"),
    ]
