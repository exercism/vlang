from lib import assert_eq, assert_error, is_error, v_inline_array


def gen_case(case):
    array = v_inline_array(case["input"]["array"], empty="[]int{}")
    call = f"find({array}, {case['input']['value']})"
    if is_error(case["expected"]):
        return assert_error(call, case)
    return assert_eq(f"{call}!", str(case["expected"]))
