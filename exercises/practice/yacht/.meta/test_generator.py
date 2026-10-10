from lib import assert_eq, snake_case


def gen_case(case):
    category = f"Category.{snake_case(case['input']['category'])}"
    first, *rest = case["input"]["dice"]
    dice = ", ".join([f"u8({first})", *map(str, rest)])
    return assert_eq(f"score({category}, [{dice}])", str(case["expected"]))
