from lib import assert_eq, v_array, v_int


def gen_case(case):
    expected = v_array(case["expected"], empty="[][]int{}")
    return [
        f"expected := {expected}",
        assert_eq(f"triplets_with_sum({v_int(case['input']['n'])})", "expected"),
    ]
