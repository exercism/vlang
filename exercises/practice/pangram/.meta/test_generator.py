from lib import assert_false, assert_true, v_string


def gen_case(case):
    call = f"is_pangram({v_string(case['input']['sentence'])})"
    return assert_true(call) if case["expected"] else assert_false(call)
