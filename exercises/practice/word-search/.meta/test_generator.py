from lib import assert_eq, indent, v_array, v_int, v_string


def v_pair(pair):
    fields = [f"column: {v_int(pair['column'])}", f"row: {v_int(pair['row'])}"]
    return "\n".join(["Pair{", indent("\n".join(fields)), "}"])


def v_location(location):
    if location is None:
        return "?WordLocation(none)"
    fields = [f"{key}: {v_pair(location[key])}" for key in ("start", "end")]
    return "\n".join(["?WordLocation{", indent("\n".join(fields)), "}"])


def v_map(locations):
    keys = [f"{v_string(word)}:" for word in locations]
    width = max(map(len, keys))
    locations = map(v_location, locations.values())
    entries = [f"{key:{width}} {location}" for key, location in zip(keys, locations)]
    return "\n".join(["{", indent("\n".join(entries)), "}"])


def gen_case(case):
    grid = v_array(case["input"]["grid"], v_string)
    words = v_array(case["input"]["wordsToSearchFor"], v_string)
    return [
        f"grid := {grid}",
        f"words_to_search_for := {words}",
        f"expected := {v_map(case['expected'])}",
        assert_eq("search(grid, words_to_search_for)", "expected"),
    ]
