from lib import assert_eq, assert_error, assert_some, is_error, v_inline_array


def v_typed_array(values, type_name):
    """Render a hex array literal whose first element fixes the element type."""
    first, *rest = values
    return v_inline_array([f"{type_name}({hex(first)})", *map(hex, rest)], str)


def gen_case(case):
    if case["property"] == "encode":
        input_type, output_type = "u32", "u8"
        call = "encode(integers)"
    else:
        input_type, output_type = "u8", "u32"
        call = "decode(integers)"
    integers = v_typed_array(case["input"]["integers"], input_type)
    lines = [f"integers := {integers}"]
    if is_error(case["expected"]):
        lines.append(assert_error(call, case, subject=call))
        return lines
    lines.append(f"expected := {v_typed_array(case['expected'], output_type)}")
    if case["property"] == "decode":
        failure = f"{call} should not return an error"
        lines.append(assert_some(call, "expected", failure))
    else:
        lines.append(assert_eq(call, "expected"))
    return lines
