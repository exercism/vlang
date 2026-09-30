from lib import assert_error, assert_some, is_error, v_int, v_string


def gen_case(case):
    call = "answer(question)"
    if is_error(case["expected"]):
        # answer returns an option, so there is no error message to check.
        subject = case["description"].removeprefix("reject ")
        check = assert_error(call, case, subject, check_message=False)
    else:
        expected = v_int(case["expected"])
        check = assert_some(call, expected, f"should return {expected}, not an error")
    return [f"question := {v_string(case['input']['question'])}", check]
