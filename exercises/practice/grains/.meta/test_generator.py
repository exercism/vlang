from lib import assert_eq, assert_error, assert_some, is_error, v_int


def gen_case(case):
    expected = case["expected"]
    if case["property"] == "total":
        return assert_eq("total_grains_on_board()", v_int(expected))
    call = f"grains_on_square({v_int(case['input']['square'])})"
    if is_error(expected):
        return assert_error(call, case, check_message=False)
    return assert_some(call, v_int(expected), f"{call} should not return an error")
