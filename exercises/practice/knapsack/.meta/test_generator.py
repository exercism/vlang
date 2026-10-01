from lib import assert_eq, indent, v_int


def v_item(item):
    fields = [f"weight: {v_int(item['weight'])}", f"value: {v_int(item['value'])}"]
    return "\n".join(["Item{", indent("\n".join(fields)), "}"])


def gen_case(case):
    items = "\n".join(
        ["[", *(indent(v_item(item)) + "," for item in case["input"]["items"]), "]"]
    )
    if not case["input"]["items"]:
        items = "[]Item{}"
    maximum_weight = v_int(case["input"]["maximumWeight"])
    return [
        f"items := {items}",
        assert_eq(f"maximum_value({maximum_weight}, items)", v_int(case["expected"])),
    ]
