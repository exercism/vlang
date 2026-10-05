import re

from lib import assert_eq, assert_error, assert_ok, is_error, v_inline_array, v_string


def gen_command(command):
    name = re.sub(r"(?=[A-Z])", "_", command["command"]).lower()
    if name == "new":
        return "mut stopwatch := Stopwatch.new()"
    if name == "advance_time":
        return f"stopwatch.advance_time({v_string(command['by'])})"
    call = f"stopwatch.{name}()"
    expected = command.get("expected")
    if expected is None:
        return assert_ok(call, f"{name}() should not return an error")
    if is_error(expected):
        return assert_error(call, command, f"{name}()", binding="_")
    if name == "state":
        return assert_eq(call, f"State.{expected}")
    if name == "previous_laps":
        return assert_eq(call, v_inline_array(expected, empty="[]string{}"))
    return assert_eq(call, v_string(expected))


def gen_case(case):
    return [gen_command(command) for command in case["input"]["commands"]]
