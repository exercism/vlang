module main

fn test_paired_square_brackets() {
	assert is_paired('[]')
}

fn test_empty_string() {
	assert is_paired('')
}

fn test_unpaired_brackets() {
	assert !is_paired('[[')
}

fn test_wrong_ordered_brackets() {
	assert !is_paired('}{')
}

fn test_wrong_closing_bracket() {
	assert !is_paired('{]')
}

fn test_paired_with_whitespace() {
	assert is_paired('{ }')
}

fn test_partially_paired_brackets() {
	assert !is_paired('{[])')
}

fn test_simple_nested_brackets() {
	assert is_paired('{[]}')
}

fn test_several_paired_brackets() {
	assert is_paired('{}[]')
}

fn test_paired_and_nested_brackets() {
	assert is_paired('([{}({}[])])')
}

fn test_unopened_closing_brackets() {
	assert !is_paired('{[)][]}')
}

fn test_unpaired_and_nested_brackets() {
	assert !is_paired('([{])')
}

fn test_paired_and_wrong_nested_brackets() {
	assert !is_paired('[({]})')
}

fn test_paired_and_wrong_nested_brackets_but_innermost_are_correct() {
	assert !is_paired('[({}])')
}

fn test_paired_and_incomplete_brackets() {
	assert !is_paired('{}[')
}

fn test_too_many_closing_brackets() {
	assert !is_paired('[]]')
}

fn test_early_unexpected_brackets() {
	assert !is_paired(')()')
}

fn test_early_mismatched_brackets() {
	assert !is_paired('{)()')
}

fn test_math_expression() {
	assert is_paired('(((185 + 223.85) * 15) - 543)/2')
}

fn test_complex_latex_expression() {
	assert is_paired('\\left(\\begin{array}{cc} \\frac{1}{3} & x\\\\ \\mathrm{e}^{x} &... x^2 \\end{array}\\right)')
}
