from lib import assert_eq, indent, v_array, v_inline_array


def v_row(row):
    return v_inline_array(row, empty="[]int{}")


def v_points(points):
    if not points:
        return "[]Point{}"
    items = [
        f"Point{{\n\trow: {point['row']}\n\tcolumn: {point['column']}\n}},"
        for point in sorted(points, key=lambda p: (p["row"], p["column"]))
    ]
    return "\n".join(["[", indent("\n".join(items)), "]"])


def gen_case(case):
    return [
        f"matrix := {v_array(case['input']['matrix'], v_row)}",
        f"expected := {v_points(case['expected'])}",
        assert_eq("saddle_points(matrix)", "expected"),
    ]
