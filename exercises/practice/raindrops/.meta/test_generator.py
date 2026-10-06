from lib import assert_eq, v_string


def gen_case(case):
    return assert_eq(
        f"raindrops({case['input']['number']})", v_string(case["expected"])
    )
