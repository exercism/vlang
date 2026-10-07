from lib import assert_error, assert_some, is_error


def gen_case(case):
    call = f"collatz({case['input']['number']})"
    if is_error(case["expected"]):
        return assert_error(call, case, check_message=False)
    expected = str(case["expected"])
    return assert_some(call, expected, f"{call} should return {expected}, not an error")
