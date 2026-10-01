from lib import assert_false, assert_true, v_inline_array
from lib import dashed_test_name as test_name  # noqa: F401


def gen_case(case):
    dominoes = v_inline_array(case["input"]["dominoes"], empty="[][]int{}")
    check = assert_true if case["expected"] else assert_false
    return [f"dominoes := {dominoes}", check("can_chain(dominoes)")]
