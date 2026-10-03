from lib import assert_eq, is_error, v_string

HEADER = """fn played(word string, guesses string) Game {
\tmut game := new_game(word)
\tfor letter in guesses.bytes() {
\t\tgame.guess(letter) or { panic(err) }
\t}
\treturn game
}

fn guess_failure(mut game Game, letter u8) string {
\tmut message := 'guessing did not fail'
\tgame.guess(letter) or { message = err.msg() }
\treturn message
}"""


def replay(case):
    word = case["input"]["word"]
    guesses = "".join(case["input"]["guesses"])
    if not guesses:
        return f"new_game({v_string(word)})"
    return f"played({v_string(word)}, {v_string(guesses)})"


def gen_case(case):
    guesses = "".join(case["input"]["guesses"])
    if is_error(case["expected"]):
        return [
            f"mut game := new_game({v_string(case['input']['word'])})",
            f"for letter in {v_string(guesses[:-1])} {{",
            "\tgame.guess(letter)!",
            "}",
            f"failure := guess_failure(mut game, `{guesses[-1]}`)",
            assert_eq("failure", v_string(case["expected"]["error"])),
        ]
    expected = case["expected"]
    return [
        f"game := {replay(case)}",
        assert_eq("game.state", f"State.{expected['state'].lower()}"),
        assert_eq("game.masked_word()", v_string(expected["maskedWord"])),
        assert_eq("game.remaining", str(expected["remainingFailures"])),
    ]
