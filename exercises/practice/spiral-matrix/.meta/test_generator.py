from lib import assert_eq, v_array, v_int


def gen_case(case):
    size = v_int(case["input"]["size"])
    return [
        f"expect := {v_array(case['expected'], empty='[][]int{}')}",
        assert_eq(f"spiral_matrix({size})", "expect"),
    ]
