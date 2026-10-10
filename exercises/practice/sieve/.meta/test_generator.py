from lib import assert_eq, v_inline_array, v_int


def gen_case(case):
    call = f"sieve({v_int(case['input']['limit'])})"
    expected = v_inline_array(case["expected"])
    return assert_eq(call, expected)
