from lib import assert_eq, assert_error, is_error, snake_case, v_int, v_string


def test_name(case):
    return snake_case(case["description"].replace(",", ""))


def gen_case(case):
    call = f"say({v_int(case['input']['number'])})"
    if is_error(case["expected"]):
        subject = case["description"].removesuffix(" are out of range")
        return assert_error(call, case, subject)
    return assert_eq(f"{call}!", v_string(case["expected"]))
