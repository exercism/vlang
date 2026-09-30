from lib import assert_eq, v_inline_array, v_int


def gen_case(case):
    basket = v_inline_array(case["input"]["basket"], empty="[]int{}")
    return [
        f"basket := {basket}",
        assert_eq("total(basket)", v_int(case["expected"])),
    ]
