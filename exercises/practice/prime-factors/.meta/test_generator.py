from lib import assert_eq, v_inline_array


def gen_case(case):
    expected = v_inline_array(case["expected"], lambda n: f"i64({n})", "[]i64{}")
    return assert_eq(f"prime_factors({case['input']['value']})", expected)
