from lib import assert_error, assert_some, v_inline_array, v_string


def v_tree(tree):
    entries = "".join(
        f"{v_string(name)}: {v_inline_array(children)}\n"
        for name, children in tree.items()
    )
    return "{\n" + entries + "}"


def gen_case(case):
    expected = case["expected"]
    lines = [f"tree := {v_tree(case['input']['familyTree'])}"]
    call = (
        "degree_of_separation(tree, "
        f"{v_string(case['input']['personA'])}, {v_string(case['input']['personB'])})"
    )
    if expected is None:
        lines.append(assert_error(call, case, check_message=False))
    else:
        failure = f"{call} should not return an error"
        lines.append(assert_some(call, str(expected), failure))
    return lines
