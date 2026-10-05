from lib import assert_error, assert_some, indent, is_error, v_string


def v_tree(tree):
    if not tree:
        return "Empty{}"
    fields = [
        f"{name}{v_tree(tree[key])}"
        for name, key in (("left:  ", "l"), ("right: ", "r"))
        if tree[key]
    ]
    fields.append(f"value: `{tree['v']}`")
    return "\n".join(["Node{", indent("\n".join(fields)), "}"])


def gen_case(case):
    call = "tree_from_traversals(preorder, inorder)"
    lines = [
        f"{name} := {v_string(''.join(case['input'][name]))}"
        for name in ("preorder", "inorder")
    ]
    if is_error(case["expected"]):
        lines.append(assert_error(call, case, binding="_"))
    else:
        tree = indent(f"return {v_tree(case['expected'])}")
        lines.append(f"expected := fn () Tree {{\n{tree}\n}}")
        lines.append(
            assert_some(call, "expected()", f"{call} should not return an error")
        )
    return lines
