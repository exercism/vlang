import re

from lib import INDENT, assert_eq, assert_error, assert_some, is_error, v_string


def v_letter(letter):
    return f"`{letter}`"


def guess(letter):
    return f"game.guess({v_letter(letter)})"


def play(word, letters):
    """Start a game and guess each of the letters, none of which may fail."""
    lines = [f"mut game := new_game({v_string(word)})"]
    if letters:
        lines += [
            f"for letter in {v_string(letters)} {{",
            f"{INDENT}game.guess(letter) or {{ assert false, 'guessing `${{letter.ascii_str()}}` should not fail' }}",
            "}",
        ]
    return lines


def gen_case(case):
    word = case["input"]["word"]
    guesses = "".join(case["input"]["guesses"])
    expected = case["expected"]

    if not guesses:
        lines = [f"game := new_game({v_string(word)})"]
    else:
        lines = play(word, guesses[:-1])
        last = guesses[-1]
        if is_error(expected):
            subject = re.sub(r" is error$", "", case["description"])
            lines.append(assert_error(guess(last), case, subject, binding="_"))
            return lines
        lines.append(
            assert_some(
                guess(last),
                f"State.{expected['state'].lower()}",
                f"guessing {v_letter(last)} should not fail",
                binding="state",
            )
        )

    return lines + [
        assert_eq("game.state", f"State.{expected['state'].lower()}"),
        assert_eq("game.masked_word()", v_string(expected["maskedWord"])),
        assert_eq("game.remaining", str(expected["remainingFailures"])),
    ]
