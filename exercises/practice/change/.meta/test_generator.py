from lib import assert_error, assert_some, is_error, v_array, v_inline_array


def gen_case(case):
    coins = v_inline_array(case["input"]["coins"])
    call = f"find_fewest_coins({coins}, {case['input']['target']})"
    if is_error(case["expected"]):
        return assert_error(call, case)
    expected = v_array(case["expected"], empty="[]int{}")
    return assert_some(call, expected, f"{call} should not return an error")
