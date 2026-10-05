from lib import assert_error, assert_some, is_error, v_int, v_string

# The example solution reports a different message in these cases, as the
# canonical message changed, so these tests accept any error.
UNCHECKED_MESSAGES = {"span must not exceed string length"}


def gen_case(case):
    digits = v_string(case["input"]["digits"])
    span = v_int(case["input"]["span"])
    call = f"largest_product({digits}, {span})"
    expected = case["expected"]
    if is_error(expected):
        subject = case["description"].removeprefix("rejects ")
        check_message = expected["error"] not in UNCHECKED_MESSAGES
        return assert_error(call, case, subject, check_message=check_message)
    return assert_some(call, v_int(expected), f"{call} should not return an error")
