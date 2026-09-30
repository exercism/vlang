from lib import assert_eq, indent, v_inline_array


def v_rune(value):
    return f"`{value}`"


def v_map(entries):
    width = max(len(key) for key, _ in entries) + 1
    lines = [f"{key + ':':{width}} {value}" for key, value in entries]
    return "\n".join(["{", indent("\n".join(lines)), "}"])


def gen_case(case):
    legacy = [
        (score, v_inline_array(letters, v_rune))
        for score, letters in case["input"]["legacy"].items()
    ]
    expected = [(v_rune(letter), score) for letter, score in case["expected"].items()]
    return [
        f"legacy := {v_map(legacy)}",
        f"expected := {v_map(expected)}",
        assert_eq("transform(legacy)", "expected"),
    ]
