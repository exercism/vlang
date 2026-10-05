from lib import assert_error, assert_some, is_error, v_int

# The example solution and the existing tests use this message, rather than
# the message in the canonical data.
ERROR = "n must be greater than 0"


def gen_case(case):
    call = f"nth_prime({v_int(case['input']['number'])})"
    expected = case["expected"]
    if is_error(expected):
        return assert_error(call, {**case, "expected": {"error": ERROR}})
    return assert_some(call, v_int(expected), f"{call} should not return an error")
