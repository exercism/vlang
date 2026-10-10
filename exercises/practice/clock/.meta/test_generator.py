from lib import assert_eq, v_string

METHODS = {"add": "add_time", "subtract": "subtract_time"}


def new_clock(clock):
    return f"new_clock({clock['hour']}, {clock['minute']})"


def gen_case(case):
    inputs = case["input"]
    prop = case["property"]
    if prop == "equal":
        op = "==" if case["expected"] else "!="
        return [
            f"c1 := {new_clock(inputs['clock1'])}",
            f"c2 := {new_clock(inputs['clock2'])}",
            f"assert c1 {op} c2",
        ]
    expected = assert_eq("c.string()", v_string(case["expected"]))
    if prop == "create":
        return [f"c := {new_clock(inputs)}", expected]
    return [
        f"mut c := {new_clock(inputs)}",
        f"c.{METHODS[prop]}({inputs['value']})",
        expected,
    ]
