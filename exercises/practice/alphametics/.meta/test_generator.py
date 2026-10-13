from lib import assert_none, assert_some, v_string


def gen_case(case):
    call = f"solve({v_string(case['input']['puzzle'])})"
    expected = case["expected"]
    if expected is None:
        return assert_none(call, "should return none")
    digits = "".join(f"\n\t`{letter}`: {digit}" for letter, digit in expected.items())
    failure = f"{call} should not return an error"
    return assert_some(call, f"{{{digits}\n}}", failure)
