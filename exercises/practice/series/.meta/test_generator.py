from lib import assert_error, assert_some, is_error, v_int, v_string, v_value


def gen_case(case):
    series = v_string(case["input"]["series"])
    call = f"slices({series}, {v_int(case['input']['sliceLength'])})"
    if is_error(case["expected"]):
        subject = case["description"].replace(" is ", " ")
        return assert_error(call, case, subject)
    return [
        f"expected := {v_value(case['expected'])}",
        assert_some(call, "expected", f"{call} should not return an error"),
    ]
