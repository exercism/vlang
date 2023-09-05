module main

import math { close }

// Complex number to a string representation of the form 'a + bi'
// Example '7.0 - 3.1i'
fn to_string(c Complex) string {
	imag := c.imaginary()

	sign := match math.signi(imag) {
		1 { '+' }
		else { '-' }
	}

	return "'${c.real()} ${sign} ${math.abs(imag)}i'"
}

fn assert_close_enough_complex(actual Complex, expected Complex) {
	real_ok := close(actual.real(), expected.real())
	imag_ok := close(actual.imaginary(), expected.imaginary())

	assert real_ok && imag_ok, 'actual = ${to_string(actual)} expected = ${to_string(expected)}'
}

fn assert_close_enough_float(actual f64, expected f64) {
	assert close(actual, expected), 'actual = ${actual}, expected = ${expected}'
}

// tests

fn test_real_part_of_a_purely_real_number() {
	z := Complex.new(1.0, 0.0)

	assert z.real() == 1.0
}

fn test_real_part_of_a_purely_imaginary_number() {
	z := Complex.new(0.0, 1.0)

	assert z.real() == 0.0
}

fn test_real_part_of_a_number_with_real_and_imaginary_part() {
	z := Complex.new(1.0, 2.0)

	assert z.real() == 1.0
}

fn test_imaginary_part_of_a_purely_real_number() {
	z := Complex.new(1.0, 0.0)

	assert z.imaginary() == 0.0
}

fn test_imaginary_part_of_a_purely_imaginary_number() {
	z := Complex.new(0.0, 1.0)

	assert z.imaginary() == 1.0
}

fn test_imaginary_part_of_a_number_with_real_and_imaginary_part() {
	z := Complex.new(1.0, 2.0)

	assert z.imaginary() == 2.0
}

fn test_multiply_imaginary_parts_only() {
	z1 := Complex.new(0.0, 1.0)
	z2 := Complex.new(0.0, 1.0)
	expected := Complex.new(-1.0, 0.0)

	assert_close_enough_complex(z1.mul(z2), expected)
}

fn test_add_purely_real_numbers() {
	z1 := Complex.new(1.0, 0.0)
	z2 := Complex.new(2.0, 0.0)

	assert z1.add(z2) == Complex.new(3.0, 0.0)
}

fn test_add_purely_imaginary_numbers() {
	z1 := Complex.new(0.0, 1.0)
	z2 := Complex.new(0.0, 2.0)

	assert z1.add(z2) == Complex.new(0.0, 3.0)
}

fn test_add_numbers_with_real_and_imaginary_part() {
	z1 := Complex.new(1.0, 2.0)
	z2 := Complex.new(3.0, 4.0)

	assert z1.add(z2) == Complex.new(4.0, 6.0)
}

fn test_subtract_purely_real_numbers() {
	z1 := Complex.new(1.0, 0.0)
	z2 := Complex.new(2.0, 0.0)

	assert z1.sub(z2) == Complex.new(-1.0, 0.0)
}

fn test_subtract_purely_imaginary_numbers() {
	z1 := Complex.new(0.0, 1.0)
	z2 := Complex.new(0.0, 2.0)

	assert z1.sub(z2) == Complex.new(0.0, -1.0)
}

fn test_subtract_numbers_with_real_and_imaginary_part() {
	z1 := Complex.new(1.0, 2.0)
	z2 := Complex.new(3.0, 4.0)

	assert z1.sub(z2) == Complex.new(-2.0, -2.0)
}

fn test_multiply_purely_real_numbers() {
	z1 := Complex.new(1.0, 0.0)
	z2 := Complex.new(2.0, 0.0)

	assert z1.mul(z2) == Complex.new(2.0, 0.0)
}

fn test_multiply_purely_imaginary_numbers() {
	z1 := Complex.new(0.0, 1.0)
	z2 := Complex.new(0.0, 2.0)

	assert z1.mul(z2) == Complex.new(-2.0, 0.0)
}

fn test_multiply_numbers_with_real_and_imaginary_part() {
	z1 := Complex.new(1.0, 2.0)
	z2 := Complex.new(3.0, 4.0)

	assert z1.mul(z2) == Complex.new(-5.0, 10)
}

fn test_divide_purely_real_numbers() {
	z1 := Complex.new(1.0, 0.0)
	z2 := Complex.new(2.0, 0.0)

	assert z1.div(z2) == Complex.new(0.5, 0.0)
}

fn test_divide_purely_imaginary_numbers() {
	z1 := Complex.new(0.0, 1.0)
	z2 := Complex.new(0.0, 2.0)

	assert z1.div(z2) == Complex.new(0.5, 0.0)
}

fn test_divide_numbers_with_real_and_imaginary_part() {
	z1 := Complex.new(1.0, 2.0)
	z2 := Complex.new(3.0, 4.0)
	expected := Complex.new(0.44, 0.08)

	assert_close_enough_complex(z1.div(z2), expected)
}

fn test_absolute_value_of_a_positive_purely_real_number() {
	z := Complex.new(5.0, 0.0)

	assert_close_enough_float(z.abs(), 5.0)
}

fn test_absolute_value_of_a_negative_purely_real_number() {
	z := Complex.new(-5.0, 0.0)

	assert_close_enough_float(z.abs(), 5.0)
}

fn test_absolute_value_of_a_purely_imaginary_number_with_positive_imaginary_part() {
	z := Complex.new(0.0, 5.0)

	assert_close_enough_float(z.abs(), 5.0)
}

fn test_absolute_value_of_a_purely_imaginary_number_with_negative_imaginary_part() {
	z := Complex.new(0.0, -5.0)

	assert_close_enough_float(z.abs(), 5.0)
}

fn test_absolute_value_of_a_number_with_real_and_imaginary_part() {
	z := Complex.new(3.0, 4.0)

	assert_close_enough_float(z.abs(), 5.0)
}

fn test_conjugate_a_purely_real_number() {
	z := Complex.new(5.0, 0.0)

	assert z.conjugate() == Complex.new(5.0, 0.0)
}

fn test_conjugate_a_purely_imaginary_number() {
	z := Complex.new(0.0, 5.0)

	assert z.conjugate() == Complex.new(0.0, -5.0)
}

fn test_conjugate_a_number_with_real_and_imaginary_part() {
	z := Complex.new(1.0, 1.0)

	assert z.conjugate() == Complex.new(1.0, -1.0)
}

fn test_eulers_identity_formula() {
	z := Complex.new(0.0, math.pi)
	expected := Complex.new(-1.0, 0.0)

	assert_close_enough_complex(z.exp(), expected)
}

fn test_exponential_of_0() {
	z := Complex.new(0.0, 0.0)

	assert z.exp() == Complex.new(1.0, 0.0)
}

fn test_exponential_of_a_purely_real_number() {
	z := Complex.new(1.0, 0.0)
	expected := Complex.new(math.e, 0.0)

	assert_close_enough_complex(z.exp(), expected)
}

fn test_exponential_of_a_number_with_real_and_imaginary_part() {
	z := Complex.new(math.log(2.0), math.pi)
	expected := Complex.new(-2.0, 0.0)

	assert_close_enough_complex(z.exp(), expected)
}

fn test_exponential_resulting_in_a_number_with_real_and_imaginary_part() {
	z := Complex.new(math.log(2.0) / 2.0, math.pi / 4.0)
	expected := Complex.new(1.0, 1.0)

	assert_close_enough_complex(z.exp(), expected)
}

fn test_add_real_number_to_complex_number() {
	z := Complex.new(1.0, 2.0)

	assert z.add_real(5.0) == Complex.new(6.0, 2.0)
}

fn test_add_complex_number_to_real_number() {
	z := Complex.new(1.0, 2.0)

	assert z.real_add(5.0) == Complex.new(6.0, 2.0)
}

fn test_subtract_real_number_from_complex_number() {
	z := Complex.new(5.0, 7.0)

	assert z.sub_real(4.0) == Complex.new(1.0, 7.0)
}

fn test_subtract_complex_number_from_real_number() {
	z := Complex.new(5.0, 7.0)

	assert z.real_sub(4.0) == Complex.new(-1.0, -7.0)
}

fn test_multiply_complex_number_by_real_number() {
	z := Complex.new(2.0, 5.0)

	assert z.mul_by_real(5.0) == Complex.new(10.0, 25.0)
}

fn test_multiply_real_number_by_complex_number() {
	z := Complex.new(2.0, 5.0)

	assert z.real_mul(5.0) == Complex.new(10.0, 25.0)
}

fn test_divide_complex_number_by_real_number() {
	z := Complex.new(10.0, 100.0)

	assert z.div_by_real(10.0) == Complex.new(1.0, 10)
}

fn test_divide_real_number_by_complex_number() {
	z := Complex.new(1.0, 1.0)

	assert z.real_div(5.0) == Complex.new(2.5, -2.5)
}
