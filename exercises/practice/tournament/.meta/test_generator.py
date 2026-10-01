from lib import assert_eq, v_string, v_text


def gen_case(case):
    rows = case["input"]["rows"]
    return [
        f"rows := {v_text(rows) if rows else v_string('')}",
        f"expected := {v_text(case['expected'])}",
        assert_eq("tally(rows)", "expected"),
    ]
