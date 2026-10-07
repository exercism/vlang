from lib import assert_eq, v_array, v_inline_array


def gen_case(case):
    expected = v_array(case["expected"], v_inline_array, "[][]int{}")
    return assert_eq(f"rows({case['input']['count']})", expected)
