from lib import assert_error, assert_some, is_error, snake_case, v_array, v_string


def test_name(case):
    return snake_case(case["description"].replace("?", "question mark"))


def gen_case(case):
    call = "convert(rows)"
    lines = [f"rows := {v_array(case['input']['rows'], v_string)}"]
    if is_error(case["expected"]):
        lines.append(assert_error(call, case, subject=call))
    else:
        expected = v_string(case["expected"])
        lines.append(assert_some(call, expected, f"{call} should not return an error"))
    return lines
