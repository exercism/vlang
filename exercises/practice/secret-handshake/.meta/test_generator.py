from lib import assert_eq, snake_case, v_inline_array


def gen_case(case):
    expected = v_inline_array(
        case["expected"], lambda command: f".{snake_case(command)}", "[]Command{}"
    )
    return assert_eq(f"commands({case['input']['number']})", expected)
