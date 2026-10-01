from lib import assert_eq, v_inline_array, v_string


def gen_case(case):
    subject = v_string(case["input"]["subject"])
    candidates = v_inline_array(case["input"]["candidates"])
    expected = v_inline_array(case["expected"], empty="[]string{}")
    return [
        f"candidates := {candidates}",
        f"expected := {expected}",
        assert_eq(f"find_anagrams({subject}, candidates)", "expected"),
    ]
