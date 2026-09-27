module main

// ids_to_string renders a hit sequence as comma separated ids. Comparing two
// dynamic arrays in V only looks at the buffer they happen to share, so the
// sequences are compared as text instead.
fn ids_to_string(ids []int) string {
	mut parts := []string{cap: ids.len}
	for id in ids {
		parts << id.str()
	}
	return parts.join(',')
}

// assert_sequence checks the traced hit sequence against the canonical one. The
// expected ids are variadic, so an empty sequence reads as a call with no
// further arguments.
fn assert_sequence(actual []int, expected ...int) {
	assert actual.len == expected.len
	assert ids_to_string(actual) == ids_to_string(expected)
}

fn test_zero_prisms() {
	start := Point{ x: 0, y: 0 }
	prisms := []Prism{}
	assert_sequence(find_sequence(start, 0, prisms)!)
}

fn test_one_prism_one_hit() {
	start := Point{ x: 0, y: 0 }
	prisms := [
		Prism{ id: 1, pos: Point{ x: 10, y: 0 }, angle: 0 },
	]
	assert_sequence(find_sequence(start, 0, prisms)!, 1)
}

fn test_one_prism_zero_hits() {
	start := Point{ x: 0, y: 0 }
	prisms := [
		Prism{ id: 1, pos: Point{ x: -10, y: 0 }, angle: 0 },
	]
	assert_sequence(find_sequence(start, 0, prisms)!)
}

fn test_going_up_zero_hits() {
	start := Point{ x: 0, y: 0 }
	prisms := [
		Prism{ id: 3, pos: Point{ x: 0, y: -10 }, angle: 0 },
		Prism{ id: 1, pos: Point{ x: -10, y: 0 }, angle: 0 },
		Prism{ id: 2, pos: Point{ x: 10, y: 0 }, angle: 0 },
	]
	assert_sequence(find_sequence(start, 90, prisms)!)
}

fn test_going_down_zero_hits() {
	start := Point{ x: 0, y: 0 }
	prisms := [
		Prism{ id: 1, pos: Point{ x: 10, y: 0 }, angle: 0 },
		Prism{ id: 2, pos: Point{ x: 0, y: 10 }, angle: 0 },
		Prism{ id: 3, pos: Point{ x: -10, y: 0 }, angle: 0 },
	]
	assert_sequence(find_sequence(start, -90, prisms)!)
}

fn test_going_left_zero_hits() {
	start := Point{ x: 0, y: 0 }
	prisms := [
		Prism{ id: 2, pos: Point{ x: 0, y: 10 }, angle: 0 },
		Prism{ id: 3, pos: Point{ x: 10, y: 0 }, angle: 0 },
		Prism{ id: 1, pos: Point{ x: 0, y: -10 }, angle: 0 },
	]
	assert_sequence(find_sequence(start, 180, prisms)!)
}

fn test_negative_angle() {
	start := Point{ x: 0, y: 0 }
	prisms := [
		Prism{ id: 1, pos: Point{ x: 0, y: -10 }, angle: 0 },
		Prism{ id: 2, pos: Point{ x: 0, y: 10 }, angle: 0 },
		Prism{ id: 3, pos: Point{ x: 10, y: 0 }, angle: 0 },
	]
	assert_sequence(find_sequence(start, -180, prisms)!)
}

fn test_large_angle() {
	start := Point{ x: 0, y: 0 }
	prisms := [
		Prism{ id: 1, pos: Point{ x: 10, y: 0 }, angle: 0 },
	]
	assert_sequence(find_sequence(start, 2340, prisms)!)
}

fn test_upward_refraction_two_hits() {
	start := Point{ x: 0, y: 0 }
	prisms := [
		Prism{ id: 1, pos: Point{ x: 10, y: 10 }, angle: 0 },
		Prism{ id: 2, pos: Point{ x: 10, y: 0 }, angle: 90 },
	]
	assert_sequence(find_sequence(start, 0, prisms)!, 2, 1)
}

fn test_downward_refraction_two_hits() {
	start := Point{ x: 0, y: 0 }
	prisms := [
		Prism{ id: 1, pos: Point{ x: 10, y: 0 }, angle: -90 },
		Prism{ id: 2, pos: Point{ x: 10, y: -10 }, angle: 0 },
	]
	assert_sequence(find_sequence(start, 0, prisms)!, 1, 2)
}

fn test_same_prism_twice() {
	start := Point{ x: 0, y: 0 }
	prisms := [
		Prism{ id: 2, pos: Point{ x: 10, y: 0 }, angle: 0 },
		Prism{ id: 1, pos: Point{ x: 20, y: 0 }, angle: -180 },
	]
	assert_sequence(find_sequence(start, 0, prisms)!, 2, 1, 2)
}

fn test_simple_path() {
	start := Point{ x: 0, y: 0 }
	prisms := [
		Prism{ id: 3, pos: Point{ x: 30, y: 10 }, angle: 45 },
		Prism{ id: 1, pos: Point{ x: 10, y: 10 }, angle: -90 },
		Prism{ id: 2, pos: Point{ x: 10, y: 0 }, angle: 90 },
		Prism{ id: 4, pos: Point{ x: 20, y: 0 }, angle: 0 },
	]
	assert_sequence(find_sequence(start, 0, prisms)!, 2, 1, 3)
}

fn test_multiple_prisms_floating_point_precision() {
	start := Point{ x: 0, y: 0 }
	prisms := [
		Prism{ id: 26, pos: Point{ x: 5.8, y: 73.4 }, angle: 6.555 },
		Prism{ id: 24, pos: Point{ x: 36.2, y: 65.2 }, angle: -0.304 },
		Prism{ id: 20, pos: Point{ x: 20.4, y: 82.8 }, angle: 45.17 },
		Prism{ id: 31, pos: Point{ x: -20.2, y: 48.8 }, angle: 30.615 },
		Prism{ id: 30, pos: Point{ x: 24.0, y: 0.6 }, angle: 28.771 },
		Prism{ id: 29, pos: Point{ x: 31.4, y: 79.4 }, angle: 61.327 },
		Prism{ id: 28, pos: Point{ x: 36.4, y: 31.4 }, angle: -18.157 },
		Prism{ id: 22, pos: Point{ x: 47.0, y: 57.8 }, angle: 54.745 },
		Prism{ id: 38, pos: Point{ x: 36.4, y: 79.2 }, angle: 49.05 },
		Prism{ id: 10, pos: Point{ x: 37.8, y: 55.2 }, angle: 11.978 },
		Prism{ id: 18, pos: Point{ x: -26.0, y: 42.6 }, angle: 22.661 },
		Prism{ id: 25, pos: Point{ x: 38.8, y: 76.2 }, angle: 51.958 },
		Prism{ id: 2, pos: Point{ x: 0.0, y: 42.4 }, angle: -21.817 },
		Prism{ id: 35, pos: Point{ x: 21.4, y: 44.8 }, angle: -171.579 },
		Prism{ id: 7, pos: Point{ x: 14.2, y: -1.6 }, angle: 19.081 },
		Prism{ id: 33, pos: Point{ x: 11.2, y: 44.4 }, angle: -165.941 },
		Prism{ id: 11, pos: Point{ x: 15.4, y: 82.6 }, angle: 66.262 },
		Prism{ id: 16, pos: Point{ x: 30.8, y: 6.6 }, angle: 35.852 },
		Prism{ id: 15, pos: Point{ x: -3.0, y: 79.2 }, angle: 53.782 },
		Prism{ id: 4, pos: Point{ x: 29.0, y: 75.4 }, angle: 17.016 },
		Prism{ id: 23, pos: Point{ x: 41.6, y: 59.8 }, angle: 70.763 },
		Prism{ id: 8, pos: Point{ x: -10.0, y: 15.8 }, angle: -9.24 },
		Prism{ id: 13, pos: Point{ x: 48.6, y: 51.8 }, angle: 45.812 },
		Prism{ id: 1, pos: Point{ x: 13.2, y: 77.0 }, angle: 17.937 },
		Prism{ id: 34, pos: Point{ x: -8.8, y: 36.8 }, angle: -4.199 },
		Prism{ id: 21, pos: Point{ x: 24.4, y: 75.8 }, angle: 20.783 },
		Prism{ id: 17, pos: Point{ x: -4.4, y: 74.6 }, angle: 24.709 },
		Prism{ id: 9, pos: Point{ x: 30.8, y: 41.8 }, angle: -165.413 },
		Prism{ id: 32, pos: Point{ x: 4.2, y: 78.6 }, angle: 40.892 },
		Prism{ id: 37, pos: Point{ x: -15.8, y: 47.0 }, angle: 33.29 },
		Prism{ id: 6, pos: Point{ x: 1.0, y: 80.6 }, angle: 51.295 },
		Prism{ id: 36, pos: Point{ x: -27.0, y: 47.8 }, angle: 92.52 },
		Prism{ id: 14, pos: Point{ x: -2.0, y: 34.4 }, angle: -52.001 },
		Prism{ id: 5, pos: Point{ x: 23.2, y: 80.2 }, angle: 31.866 },
		Prism{ id: 27, pos: Point{ x: -5.6, y: 32.8 }, angle: -75.303 },
		Prism{ id: 12, pos: Point{ x: -1.0, y: 0.2 }, angle: 0.0 },
		Prism{ id: 3, pos: Point{ x: -6.6, y: 3.2 }, angle: 46.72 },
		Prism{ id: 19, pos: Point{ x: -13.8, y: 24.2 }, angle: -9.205 },
	]
	assert_sequence(find_sequence(start, -6.429, prisms)!, 7, 30, 16, 28, 13, 22, 23, 10, 9, 24, 25, 38, 29, 4, 35, 21, 5, 20, 11, 1, 33, 26, 32, 6, 15, 17, 2, 14, 27, 34, 37, 31, 36, 18, 19, 8, 3, 12)
}

fn test_complex_path_with_multiple_prisms_floating_point_precision() {
	start := Point{ x: 0, y: 0 }
	prisms := [
		Prism{ id: 46, pos: Point{ x: 37.4, y: 20.6 }, angle: -88.332 },
		Prism{ id: 72, pos: Point{ x: -24.2, y: 23.4 }, angle: -90.774 },
		Prism{ id: 25, pos: Point{ x: 78.6, y: 7.8 }, angle: 98.562 },
		Prism{ id: 60, pos: Point{ x: -58.8, y: 31.6 }, angle: 115.56 },
		Prism{ id: 22, pos: Point{ x: 75.2, y: 28.0 }, angle: 63.515 },
		Prism{ id: 2, pos: Point{ x: 89.8, y: 27.8 }, angle: 91.176 },
		Prism{ id: 23, pos: Point{ x: 9.8, y: 30.8 }, angle: 30.829 },
		Prism{ id: 69, pos: Point{ x: 22.8, y: 20.6 }, angle: -88.315 },
		Prism{ id: 44, pos: Point{ x: -0.8, y: 15.6 }, angle: -116.565 },
		Prism{ id: 36, pos: Point{ x: -24.2, y: 8.2 }, angle: -90.0 },
		Prism{ id: 53, pos: Point{ x: -1.2, y: 0.0 }, angle: 0.0 },
		Prism{ id: 52, pos: Point{ x: 14.2, y: 24.0 }, angle: -143.896 },
		Prism{ id: 5, pos: Point{ x: -65.2, y: 21.6 }, angle: 93.128 },
		Prism{ id: 66, pos: Point{ x: 5.4, y: 15.6 }, angle: 31.608 },
		Prism{ id: 51, pos: Point{ x: -72.6, y: 21.0 }, angle: -100.976 },
		Prism{ id: 65, pos: Point{ x: 48.0, y: 10.2 }, angle: 87.455 },
		Prism{ id: 21, pos: Point{ x: -41.8, y: 0.0 }, angle: 68.352 },
		Prism{ id: 18, pos: Point{ x: -46.2, y: 19.2 }, angle: -128.362 },
		Prism{ id: 10, pos: Point{ x: 74.4, y: 0.4 }, angle: 90.939 },
		Prism{ id: 15, pos: Point{ x: 67.6, y: 0.4 }, angle: 84.958 },
		Prism{ id: 35, pos: Point{ x: 14.8, y: -0.4 }, angle: 89.176 },
		Prism{ id: 1, pos: Point{ x: 83.0, y: 0.2 }, angle: 89.105 },
		Prism{ id: 68, pos: Point{ x: 14.6, y: 28.0 }, angle: -29.867 },
		Prism{ id: 67, pos: Point{ x: 79.8, y: 18.6 }, angle: -136.643 },
		Prism{ id: 38, pos: Point{ x: 53.0, y: 14.6 }, angle: -90.848 },
		Prism{ id: 31, pos: Point{ x: -58.0, y: 6.6 }, angle: -61.837 },
		Prism{ id: 74, pos: Point{ x: -30.8, y: 0.4 }, angle: 85.966 },
		Prism{ id: 48, pos: Point{ x: -4.6, y: 10.0 }, angle: -161.222 },
		Prism{ id: 12, pos: Point{ x: 59.0, y: 5.0 }, angle: -91.164 },
		Prism{ id: 33, pos: Point{ x: -16.4, y: 18.4 }, angle: 90.734 },
		Prism{ id: 4, pos: Point{ x: 82.6, y: 27.6 }, angle: 71.127 },
		Prism{ id: 75, pos: Point{ x: -10.2, y: 30.6 }, angle: -1.108 },
		Prism{ id: 28, pos: Point{ x: 38.0, y: 0.0 }, angle: 86.863 },
		Prism{ id: 11, pos: Point{ x: 64.4, y: -0.2 }, angle: 92.353 },
		Prism{ id: 9, pos: Point{ x: -51.4, y: 31.6 }, angle: 67.249 },
		Prism{ id: 26, pos: Point{ x: -39.8, y: 30.8 }, angle: 61.113 },
		Prism{ id: 30, pos: Point{ x: -34.2, y: 0.6 }, angle: 111.33 },
		Prism{ id: 56, pos: Point{ x: -51.0, y: 0.2 }, angle: 70.445 },
		Prism{ id: 41, pos: Point{ x: -12.0, y: 0.0 }, angle: 91.219 },
		Prism{ id: 24, pos: Point{ x: 63.8, y: 14.4 }, angle: 86.586 },
		Prism{ id: 70, pos: Point{ x: -72.8, y: 13.4 }, angle: -87.238 },
		Prism{ id: 3, pos: Point{ x: 22.4, y: 7.0 }, angle: -91.685 },
		Prism{ id: 13, pos: Point{ x: 34.4, y: 7.0 }, angle: 90.0 },
		Prism{ id: 16, pos: Point{ x: -47.4, y: 11.4 }, angle: -136.02 },
		Prism{ id: 6, pos: Point{ x: 90.0, y: 0.2 }, angle: 90.415 },
		Prism{ id: 54, pos: Point{ x: 44.0, y: 27.8 }, angle: 85.969 },
		Prism{ id: 32, pos: Point{ x: -9.0, y: 0.0 }, angle: 91.615 },
		Prism{ id: 8, pos: Point{ x: -31.6, y: 30.8 }, angle: 0.535 },
		Prism{ id: 39, pos: Point{ x: -12.0, y: 8.2 }, angle: 90.0 },
		Prism{ id: 14, pos: Point{ x: -79.6, y: 32.4 }, angle: 92.342 },
		Prism{ id: 42, pos: Point{ x: 65.8, y: 20.8 }, angle: -85.867 },
		Prism{ id: 40, pos: Point{ x: -65.0, y: 14.0 }, angle: 87.109 },
		Prism{ id: 45, pos: Point{ x: 10.6, y: 18.8 }, angle: 23.697 },
		Prism{ id: 71, pos: Point{ x: -24.2, y: 18.6 }, angle: -88.531 },
		Prism{ id: 7, pos: Point{ x: -72.6, y: 6.4 }, angle: -89.148 },
		Prism{ id: 62, pos: Point{ x: -32.0, y: 24.8 }, angle: -140.8 },
		Prism{ id: 49, pos: Point{ x: 34.4, y: -0.2 }, angle: 89.415 },
		Prism{ id: 63, pos: Point{ x: 74.2, y: 12.6 }, angle: -138.429 },
		Prism{ id: 59, pos: Point{ x: 82.8, y: 13.0 }, angle: -140.177 },
		Prism{ id: 34, pos: Point{ x: -9.4, y: 23.2 }, angle: -88.238 },
		Prism{ id: 76, pos: Point{ x: -57.6, y: 0.0 }, angle: 1.2 },
		Prism{ id: 43, pos: Point{ x: 7.0, y: 0.0 }, angle: 116.565 },
		Prism{ id: 20, pos: Point{ x: 45.8, y: -0.2 }, angle: 1.469 },
		Prism{ id: 37, pos: Point{ x: -16.6, y: 13.2 }, angle: 84.785 },
		Prism{ id: 58, pos: Point{ x: -79.0, y: -0.2 }, angle: 89.481 },
		Prism{ id: 50, pos: Point{ x: -24.2, y: 12.8 }, angle: -86.987 },
		Prism{ id: 64, pos: Point{ x: 59.2, y: 10.2 }, angle: -92.203 },
		Prism{ id: 61, pos: Point{ x: -72.0, y: 26.4 }, angle: -83.66 },
		Prism{ id: 47, pos: Point{ x: 45.4, y: 5.8 }, angle: -82.992 },
		Prism{ id: 17, pos: Point{ x: -52.2, y: 17.8 }, angle: -52.938 },
		Prism{ id: 57, pos: Point{ x: -61.8, y: 32.0 }, angle: 84.627 },
		Prism{ id: 29, pos: Point{ x: 47.2, y: 28.2 }, angle: 92.954 },
		Prism{ id: 27, pos: Point{ x: -4.6, y: 0.2 }, angle: 87.397 },
		Prism{ id: 55, pos: Point{ x: -61.4, y: 26.4 }, angle: 94.086 },
		Prism{ id: 73, pos: Point{ x: -40.4, y: 13.4 }, angle: -62.229 },
		Prism{ id: 19, pos: Point{ x: 53.2, y: 20.6 }, angle: -87.181 },
	]
	assert_sequence(find_sequence(start, 0.0, prisms)!, 43, 44, 66, 45, 52, 35, 49, 13, 3, 69, 46, 28, 20, 11, 24, 38, 19, 42, 15, 10, 63, 25, 59, 1, 6, 2, 4, 67, 22, 29, 65, 64, 12, 47, 54, 68, 23, 75, 8, 26, 18, 9, 60, 17, 31, 7, 70, 40, 5, 51, 61, 55, 57, 14, 58, 76, 56, 16, 21, 30, 73, 62, 74, 41, 39, 36, 50, 37, 33, 71, 72, 34, 32, 27, 48, 53)
}
