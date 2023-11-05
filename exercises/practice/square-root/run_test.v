module main

fn test_root_of_0() {
	assert square_root(0) == 0
}

fn test_root_of_1() {
	assert square_root(1) == 1
}

fn test_root_of_4() {
	assert square_root(4) == 2
}

fn test_root_of_25() {
	assert square_root(25) == 5
}

fn test_root_of_81() {
	assert square_root(81) == 9
}

fn test_root_of_196() {
	assert square_root(196) == 14
}

fn test_root_of_65025() {
	assert square_root(65025) == 255
}

fn test_root_of_5764801() {
	assert square_root(5764801) == 2401
}
