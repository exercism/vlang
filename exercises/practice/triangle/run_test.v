module main

// EQUILATERAL TRIANGLES
fn test_true_eq_triangle() {
	assert is_equilateral(2, 2, 2)
}

fn test_false_eq_one_side_unequal() {
	assert !is_equilateral(2, 3, 2)
}

fn test_false_eq_all_sides_unequal() {
	assert !is_equilateral(5, 4, 6)
}

fn test_true_eq_float_triangle() {
	assert is_equilateral(0.5, 0.5, 0.5)
}


// ISOSCELES TRIANGLES
fn test_true_iso_last_two_equal() {
	assert is_isosceles(3, 4, 4)
}

fn test_true_iso_first_two_equal() {
	assert is_isosceles(4, 4, 3)
}

fn test_true_iso_outer_equal() {
	assert is_isosceles(4, 3, 4)
}

fn test_true_iso_all_equal() {
	assert is_isosceles(4, 4, 4)
}

fn test_false_iso_all_unequal() {
	assert !is_isosceles(2, 3, 4)
}

fn test_false_iso_triangle_inequality_113() {
	assert !is_isosceles(1, 1, 3)
}

fn test_false_iso_triangle_inequality_131() {
	assert !is_isosceles(1, 3, 1)
}

fn test_false_iso_triangle_inequality_311() {
	assert !is_isosceles(3, 1, 1)
}

fn test_true_iso_float_sides() {
	assert is_isosceles(0.5, 0.4, 0.5)
}

// SCALENE TRIANGLES
fn test_true_sca_none_equal() {
	assert is_scalene(5, 4, 6)
}

fn test_false_sca_all_equal() {
	assert !is_scalene(4, 4, 4)
}

fn test_false_sca_first_second_equal() {
	assert !is_scalene(4, 4, 3)
}

fn test_false_sca_first_third_equal() {
	assert !is_scalene(3, 4, 3)
}

fn test_false_sca_second_third_equal() {
	assert !is_scalene(4, 3, 3)
}

fn test_false_sca_triangle_inequality() {
	assert !is_scalene(7, 3, 2)
}

fn test_true_sca_float_sides() {
	assert is_scalene(0.5, 0.4, 0.6)
}