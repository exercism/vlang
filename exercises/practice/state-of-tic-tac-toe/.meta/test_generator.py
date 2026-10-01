from lib import assert_eq, assert_error, is_error, snake_case, v_array


def test_name(case):
    parts = [*case["parents"], *case["description"].split(": ")]
    return "__".join(snake_case(part) for part in parts)


def gen_case(case):
    lines = [f"board := {v_array(case['input']['board'])}"]
    if is_error(case["expected"]):
        lines.append(assert_error("gamestate(board)", case))
    else:
        lines.append(assert_eq("gamestate(board)!", f".{case['expected']}"))
    return lines
