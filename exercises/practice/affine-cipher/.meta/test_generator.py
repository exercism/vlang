from lib import assert_eq, assert_error, is_error, v_string


def gen_case(case):
    key = case["input"]["key"]
    call = f"{case['property']}(phrase, Key{{ a: {key['a']}, b: {key['b']} }})"
    lines = [f"phrase := {v_string(case['input']['phrase'])}"]
    if is_error(case["expected"]):
        lines.append(assert_error(call, case))
    else:
        lines.append(f"expect := {v_string(case['expected'])}")
        lines.append(assert_eq(f"{call}!", "expect"))
    return lines
