from lib import assert_eq, v_inline_array, v_int


def gen_case(case):
    factors = v_inline_array(case["input"]["factors"], v_int, empty="[]int{}")
    limit = v_int(case["input"]["limit"])
    return [
        f"factors := {factors}",
        assert_eq(f"sum(factors, {limit})", v_int(case["expected"])),
    ]
