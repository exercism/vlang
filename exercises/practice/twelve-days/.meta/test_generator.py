from lib import assert_eq, v_int, v_string, v_text
from lib import nested_test_name as test_name  # noqa: F401


def gen_case(case):
    start = v_int(case["input"]["startVerse"])
    end = v_int(case["input"]["endVerse"])
    lines = case["expected"]
    expected = v_text(lines) if len(lines) > 1 else v_string(lines[0])
    return [
        f"expected := {expected}",
        assert_eq(f"recite({start}, {end})", "expected"),
    ]
