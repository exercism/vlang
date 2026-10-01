from lib import INDENT, assert_eq, v_int, v_string


def v_map(counts):
    keys = [f"{v_string(word)}:" for word in counts]
    width = max(map(len, keys))
    entries = zip(keys, counts.values())
    lines = [f"{INDENT}{key:{width}} {v_int(count)}" for key, count in entries]
    return "\n".join(["{", *lines, "}"])


def gen_case(case):
    sentence = v_string(case["input"]["sentence"])
    return [
        f"expected := {v_map(case['expected'])}",
        assert_eq(f"count_words({sentence})", "expected"),
    ]
