from lib import (
    assert_eq,
    assert_error,
    assert_some,
    is_error,
    snake_case,
    v_inline_array,
)

PREFIXES = {"transmitSequence": "transmit", "decodeMessage": "decode"}


def test_name(case):
    name = snake_case(case["description"])
    if name.endswith("message"):
        return f"{PREFIXES[case['property']]}_{name}"
    return name


def message(values):
    return v_inline_array(values, lambda value: f"u8({value})", empty="[]u8{}")


def gen_case(case):
    data = message(case["input"]["message"])
    if case["property"] == "transmitSequence":
        return assert_eq(f"transmit_sequence({data})", message(case["expected"]))
    call = f"decode_message({data})"
    if is_error(case["expected"]):
        return assert_error(call, case)
    expected = message(case["expected"])
    return assert_some(
        call, expected, f"{case['description']} should not return an error"
    )
