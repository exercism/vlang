from lib import assert_eq, v_value

HEADER = "const empty = []int{cap: 0}"


def gen_case(case):
    lines = []
    args = []
    for name, key in (("list_one", "listOne"), ("list_two", "listTwo")):
        if case["input"][key]:
            lines.append(f"{name} := {v_value(case['input'][key])}")
            args.append(name)
        else:
            args.append("empty")
    lines.append(assert_eq(f"compare({', '.join(args)})", f".{case['expected']}"))
    return lines
