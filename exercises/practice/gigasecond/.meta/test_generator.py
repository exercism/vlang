from lib import assert_eq, v_string

HEADER = "import time"


def parse(moment):
    return f"time.parse_iso8601({v_string(moment)})!"


def gen_case(case):
    moment = parse(case["input"]["moment"])
    if case["property"] == "isEqual":
        return [
            f"moment := {moment}",
            "add_gigasecond(moment)",
            assert_eq("moment", moment),
        ]
    return assert_eq(f"add_gigasecond({moment})", parse(case["expected"]))
