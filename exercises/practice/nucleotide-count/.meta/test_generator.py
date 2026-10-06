from lib import assert_eq, assert_error, is_error, v_string


def gen_case(case):
    call = f"count_nucleotides({v_string(case['input']['strand'])})"
    if is_error(case["expected"]):
        return assert_error(call, case, check_message=False)
    counts = "".join(
        f"\n\t{v_string(nucleotide)}: {count}"
        for nucleotide, count in case["expected"].items()
    )
    return assert_eq(f"{call}!", f"{{{counts}\n}}")
