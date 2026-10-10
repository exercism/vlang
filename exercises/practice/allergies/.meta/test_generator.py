from lib import assert_eq, assert_false, assert_true, snake_case, v_inline_array

HEADER = """fn to_int(allergen Allergen) int {
\treturn int(allergen)
}

fn same_in_any_order(left []Allergen, right []Allergen) bool {
\treturn left.map(to_int).sorted() == right.map(to_int).sorted()
}"""


def test_name(case):
    group = case["parents"][0].removeprefix("testing for ").removesuffix(" when:")
    return f"{snake_case(group)}__{snake_case(case['description'])}"


def allergen(item):
    return f"Allergen.{item}"


def gen_case(case):
    score = case["input"]["score"]
    if case["property"] == "allergicTo":
        call = f"allergic_to({allergen(case['input']['item'])}, {score})"
        return assert_true(call) if case["expected"] else assert_false(call)
    call = f"list({score})"
    expected = v_inline_array(case["expected"], allergen)
    if len(case["expected"]) <= 1:
        return assert_eq(call, expected)
    return assert_true(f"same_in_any_order({call}, {expected})")
