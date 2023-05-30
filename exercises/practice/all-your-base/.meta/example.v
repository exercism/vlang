module main

fn generate_digits(output_base int, value int, mut dest []int) {
	last_digit := value % output_base
	if value >= output_base {
		generate_digits(output_base, value / output_base, mut &dest)
	}
	dest << last_digit
}

fn rebase(input_base int, digits []int, output_base int) ![]int {
	if input_base < 2 {
		return error('input base must be >= 2')
	}
	if output_base < 2 {
		return error('output base must be >= 2')
	}

	mut value := 0
	for digit in digits {
		if digit < 0 || digit >= input_base {
			return error('all digits must satisfy 0 <= d < input base')
		}
		value = value * input_base + digit
	}

	mut result := []int{}
	generate_digits(output_base, value, mut &result)
	return result
}
