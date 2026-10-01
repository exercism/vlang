from lib import assert_eq, assert_error, is_error, v_string


def gen_case(case):
    prop = case["property"]
    lines = [f"phrase := {v_string(case['input']['phrase'])}"]
    if is_error(case["expected"]):
        lines.append(assert_error(f"{prop}(phrase)", case))
    else:
        lines.append(assert_eq(f"{prop}(phrase)!", v_string(case["expected"])))
    return lines
