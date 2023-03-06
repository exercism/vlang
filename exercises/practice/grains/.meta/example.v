module main

fn grains_on_square(square int) !u64 {
	if !error_if_bad_square(square) {
		return pow(2, square-1)
	}
	return error("square must be between 1 and 64")
}

fn total_grains_on_board() u64 {
	return 0xFFFFFFFF_FFFFFFFF
}

fn pow(a u64, b int) u64 {
	mut pow := u64(1)
	for _ in 0 .. b {
		pow *= a
	}
	return pow
}

fn error_if_bad_square(square int) bool {
	if square <= 0 || square > 64 {
		return true
	}
	return false
}