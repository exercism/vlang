from lib import assert_error, assert_some, is_error, v_string


def gen_case(case):
    call = f"count_nucleotides({v_string(case['input']['strand'])})"
    if is_error(case["expected"]):
        return assert_error(call, case, check_message=False)
    counts = "".join(
        f"\n\t{v_string(nucleotide)}: {count}"
        for nucleotide, count in case["expected"].items()
    )
    failure = f"{call} should not return an error"
    return assert_some(call, f"{{{counts}\n}}", failure)
