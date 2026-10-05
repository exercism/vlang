from lib import assert_error, assert_some, is_error, v_string


def gen_case(case):
    prop = case["property"]
    call = f"{prop}(phrase)"
    lines = [f"phrase := {v_string(case['input']['phrase'])}"]
    if is_error(case["expected"]):
        lines.append(assert_error(call, case))
    else:
        expected = v_string(case["expected"])
        lines.append(assert_some(call, expected, f"{call} should not return an error"))
    return lines
