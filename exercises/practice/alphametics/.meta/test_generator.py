from lib import assert_eq, v_string

HEADER = """// assignment presents a solution as `LETTER=digit` pairs, sorted by letter and
// separated by spaces, so that two solutions can be compared as plain text. A
// puzzle without a solution comes back as an empty string.
fn assignment(solution ?map[string]int) string {
\tdigits := (solution or { return '' }).clone()
\tmut letters := digits.keys()
\tletters.sort()
\tmut pairs := []string{cap: letters.len}
\tfor letter in letters {
\t\tpairs << '${letter}=${digits[letter]}'
\t}
\treturn pairs.join(' ')
}"""


def v_assignment(solution):
    if solution is None:
        return "''"
    pairs = " ".join(f"{letter}={digit}" for letter, digit in sorted(solution.items()))
    return v_string(pairs)


def gen_case(case):
    call = f"assignment(solve({v_string(case['input']['puzzle'])}))"
    return assert_eq(call, v_assignment(case["expected"]))
