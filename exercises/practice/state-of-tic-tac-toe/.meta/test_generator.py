from lib import assert_error, assert_some, is_error, snake_case, v_array


def test_name(case):
    parts = [*case["parents"], *case["description"].split(": ")]
    return "__".join(snake_case(part) for part in parts)


def gen_case(case):
    call = "gamestate(board)"
    lines = [f"board := {v_array(case['input']['board'])}"]
    if is_error(case["expected"]):
        lines.append(assert_error(call, case))
    else:
        expected = f".{case['expected']}"
        lines.append(assert_some(call, expected, f"{call} should not return an error"))
    return lines
