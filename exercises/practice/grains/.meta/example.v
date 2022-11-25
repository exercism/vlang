module main

fn grains_on_square(square i64) !i64 {
	if !error_if_bad_square(square) {
		return pow(2, square-1)
	}
	return error("square must be between 1 and 64")
}

fn total_grains_on_board() i64 {
	return pow(2, 64) - 1
}

fn pow(a i64, b i64) i64 {
	mut pow := i64(1)
	for _ in 0 .. b {
		pow *= a
	}
	return pow
}

fn error_if_bad_square(square i64) bool {
	if square <= 0 || square > 64 {
		return true
	}
	return false
}