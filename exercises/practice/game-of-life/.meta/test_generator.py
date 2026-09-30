from lib import assert_eq, v_array


def gen_case(case):
    matrix = v_array(case["input"]["matrix"], empty="[][]int{}")
    expect = v_array(case["expected"], empty="[][]int{}")
    return [
        f"matrix := {matrix}",
        f"expect := {expect}",
        assert_eq("tick(matrix)", "expect"),
    ]
