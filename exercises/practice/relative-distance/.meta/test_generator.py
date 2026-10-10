from lib import assert_eq, assert_error, v_inline_array, v_string


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
        lines.append(assert_eq(f"{call}!", str(expected)))
    return lines
