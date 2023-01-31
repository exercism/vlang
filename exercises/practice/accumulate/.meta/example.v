module main

fn accumulate_ints(values []int, operation fn (int) int) []int {
	mut new_values := []int{}

	for value in values {
		new_values << operation(value)
	}

	return new_values
}

// Because V functions cannot be overloaded[1], let's make another
// function called `accumulate_strs` that does the same thing for strings
// instead of ints
fn accumulate_strs(values []string, operation fn (string) string) []string {
	mut new_values := []string{}

	for value in values {
		new_values << operation(value)
	}

	return new_values
}
