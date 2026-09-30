from lib import assert_none, assert_some, v_array


def gen_case(case):
    call = "winner(board)"
    expected = case["expected"]
    if expected:
        check = assert_some(call, f"`{expected}`", f"should return {expected}")
    else:
        check = assert_none(call, "should return none")
    return [f"board := {v_array(case['input']['board'])}", check]
