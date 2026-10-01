from lib import assert_eq, v_inline_array
from lib import nested_test_name as test_name  # noqa: F401


def gen_tree(tree, name, path):
    lines = [assert_eq(f"{name}.data", tree["data"])]
    for side in ("left", "right"):
        child = tree[side]
        if child is None:
            lines.append(f"assert {name}.{side} is Empty")
        else:
            child_name = path + side[0]
            lines.append(f"assert {name}.{side} is Node")
            lines.append(f"{child_name} := {name}.{side} as Node")
            lines.extend(gen_tree(child, child_name, child_name))
    return lines


def gen_case(case):
    first, *rest = case["input"]["treeData"]
    lines = [f"mut root := Node.new({first})"]
    lines.extend(f"root.insert({data})" for data in rest)
    if case["property"] == "data":
        lines.extend(gen_tree(case["expected"], "root", ""))
    else:
        expected = v_inline_array(case["expected"], str)
        lines.append(assert_eq("sorted_data(root)", expected))
    return lines
