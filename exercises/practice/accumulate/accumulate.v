module main

fn accumulate_ints(values []int, operation fn (int) int) []int {
}

// Because V functions cannot be overloaded[1], make another function
//  called `accumulate_strs` that does the same thing for strings
// instead of ints
