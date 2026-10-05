from lib import assert_error, assert_some, is_error, snake_case, v_int, v_string


def test_name(case):
    return snake_case(case["description"].replace(",", ""))


def gen_case(case):
    call = f"say({v_int(case['input']['number'])})"
    if is_error(case["expected"]):
        subject = case["description"].removesuffix(" are out of range")
        return assert_error(call, case, subject)
    expected = v_string(case["expected"])
    return assert_some(call, expected, f"{call} should not return an error")
