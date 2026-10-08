from lib import INDENT, assert_error, assert_ok, assert_some, is_error, v_inline_array


def gen_case(case):
    rolls = v_inline_array(case["input"]["previousRolls"], empty="[]int{}")
    lines = [
        "mut game := Game.new()",
        f"rolls := {rolls}",
        "for pins in rolls {",
        INDENT + assert_ok("game.roll(pins)", "rolling should not fail"),
        "}",
    ]
    if case["property"] == "roll":
        call = f"game.roll({case['input']['roll']})"
        lines.append(assert_error(call, case, subject=call, binding="_"))
    elif is_error(case["expected"]):
        lines.append(assert_error("game.score()", case, subject="game.score()"))
    else:
        lines.append(
            assert_some(
                "game.score()",
                case["expected"],
                "game.score() should not return an error",
            )
        )
    return lines
