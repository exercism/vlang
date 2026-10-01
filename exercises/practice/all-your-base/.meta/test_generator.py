import re

from lib import assert_eq, assert_error, is_error, v_int, v_value


def gen_case(case):
    inp = case["input"]
    digits = v_value(inp["digits"])
    call = f"rebase({v_int(inp['inputBase'])}, {digits}, {v_int(inp['outputBase'])})"
    if is_error(case["expected"]):
        subject = re.sub(r" (is|are) ", " ", case["description"])
        return assert_error(call, case, subject)
    return assert_eq(f"{call}!", v_value(case["expected"]))
