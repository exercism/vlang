from lib import assert_eq, v_int, v_string
from lib import nested_test_name as test_name  # noqa: F401


def gen_case(case):
    start = case["input"]
    x, y = (v_int(start["position"][axis]) for axis in "xy")
    robot = f"robot := Robot.new({x}, {y}, .{start['direction']})"
    lines = [robot]
    if case["property"] == "move":
        lines = [f"mut {robot}", f"robot.move({v_string(start['instructions'])})"]
    expected = case["expected"]
    return [
        *lines,
        assert_eq("robot.position.x", v_int(expected["position"]["x"])),
        assert_eq("robot.position.y", v_int(expected["position"]["y"])),
        assert_eq("robot.direction", f".{expected['direction']}"),
    ]
