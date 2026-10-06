from lib import assert_eq, v_string


def gen_case(case):
    dna = v_string(case["input"]["dna"])
    return assert_eq(f"to_rna({dna})", v_string(case["expected"]))
