module main

import math

// assert if 'actual' and 'expected' are _not_ within 1e-14 of each other
fn assert_close_enough(actual f64, expected f64) {
	assert math.close(actual, expected), 'actual = ${actual}, expected = ${expected}'
}

// tests

// add

fn test_add_two_positive_rational_numbers() {
	r1 := Rational.new(1, 2)
	r2 := Rational.new(2, 3)

	assert r1.add(r2) == Rational.new(7, 6)
}

fn test_add_a_positive_rational_number_and_a_negative_rational_number() {
	r1 := Rational.new(1, 2)
	r2 := Rational.new(-2, 3)

	assert r1.add(r2) == Rational.new(-1, 6)
}

fn test_add_two_negative_rational_numbers() {
	r1 := Rational.new(-1, 2)
	r2 := Rational.new(-2, 3)

	assert r1.add(r2) == Rational.new(-7, 6)
}

fn test_add_a_rational_number_to_its_additive_inverse() {
	r1 := Rational.new(1, 2)
	r2 := Rational.new(-1, 2)

	assert r1.add(r2) == Rational.new(0, 1)
}

// subtract (sub)

fn test_subtract_two_positive_rational_numbers() {
	r1 := Rational.new(1, 2)
	r2 := Rational.new(2, 3)

	assert r1.sub(r2) == Rational.new(-1, 6)
}

fn test_subtract_a_positive_rational_number_and_a_negative_rational_number() {
	r1 := Rational.new(1, 2)
	r2 := Rational.new(-2, 3)

	assert r1.sub(r2) == Rational.new(7, 6)
}

fn test_subtract_two_negative_rational_numbers() {
	r1 := Rational.new(-1, 2)
	r2 := Rational.new(-2, 3)

	assert r1.sub(r2) == Rational.new(1, 6)
}

fn test_subtract_a_rational_number_from_itself() {
	r1 := Rational.new(1, 2)
	r2 := Rational.new(1, 2)

	assert r1.sub(r2) == Rational.new(0, 1)
}

// multiply (mul)

fn test_multiply_two_positive_rational_numbers() {
	r1 := Rational.new(1, 2)
	r2 := Rational.new(2, 3)

	assert r1.mul(r2) == Rational.new(1, 3)
}

fn test_multiply_a_negative_rational_number_by_a_positive_rational_number() {
	r1 := Rational.new(-1, 2)
	r2 := Rational.new(2, 3)

	assert r1.mul(r2) == Rational.new(-1, 3)
}

fn test_multiply_two_negative_rational_numbers() {
	r1 := Rational.new(-1, 2)
	r2 := Rational.new(-2, 3)

	assert r1.mul(r2) == Rational.new(1, 3)
}

fn test_multiply_a_rational_number_by_its_reciprocal() {
	r1 := Rational.new(1, 2)
	r2 := Rational.new(2, 1)

	assert r1.mul(r2) == Rational.new(1, 1)
}

fn test_multiply_a_rational_number_by_1() {
	r1 := Rational.new(1, 2)
	r2 := Rational.new(1, 1)

	assert r1.mul(r2) == Rational.new(1, 2)
}

fn test_multiply_a_rational_number_by_0() {
	r1 := Rational.new(1, 2)
	r2 := Rational.new(0, 1)

	assert r1.mul(r2) == Rational.new(0, 1)
}

// divide (div)

fn test_divide_two_positive_rational_numbers() {
	r1 := Rational.new(1, 2)
	r2 := Rational.new(2, 3)

	assert r1.div(r2) == Rational.new(3, 4)
}

fn test_divide_a_positive_rational_number_by_a_negative_rational_number() {
	r1 := Rational.new(1, 2)
	r2 := Rational.new(-2, 3)

	assert r1.div(r2) == Rational.new(-3, 4)
}

fn test_divide_two_negative_rational_numbers() {
	r1 := Rational.new(-1, 2)
	r2 := Rational.new(-2, 3)

	assert r1.div(r2) == Rational.new(3, 4)
}

fn test_divide_a_rational_number_by_1() {
	r1 := Rational.new(1, 2)
	r2 := Rational.new(1, 1)

	assert r1.div(r2) == Rational.new(1, 2)
}

// absolute value (abs)

fn test_absolute_value_of_a_positive_rational_number() {
	r := Rational.new(1, 2)

	assert r.abs() == Rational.new(1, 2)
}

fn test_absolute_value_of_a_positive_rational_number_with_negative_numerator_and_denominator() {
	r := Rational.new(-1, -2)

	assert r.abs() == Rational.new(1, 2)
}

fn test_absolute_value_of_a_negative_rational_number() {
	r := Rational.new(-1, 2)

	assert r.abs() == Rational.new(1, 2)
}

fn test_absolute_value_of_a_negative_rational_number_with_negative_denominator() {
	r := Rational.new(1, -2)

	assert r.abs() == Rational.new(1, 2)
}

fn test_absolute_value_of_zero() {
	r := Rational.new(0, 1)

	assert r.abs() == Rational.new(0, 1)
}

fn test_absolute_value_of_a_rational_number_is_reduced_to_lowest_terms() {
	r := Rational.new(2, 4)

	assert r.abs() == Rational.new(1, 2)
}

// exprational (r^n)

fn test_raise_a_positive_rational_number_to_a_positive_integer_power() {
	r := Rational.new(1, 2)

	assert r.exprational(3) == Rational.new(1, 8)
}

fn test_raise_a_negative_rational_number_to_a_positive_integer_power() {
	r := Rational.new(-1, 2)

	assert r.exprational(3) == Rational.new(-1, 8)
}

fn test_raise_a_positive_rational_number_to_a_negative_integer_power() {
	r := Rational.new(3, 5)

	assert r.exprational(-2) == Rational.new(25, 9)
}

fn test_raise_a_negative_rational_number_to_an_even_negative_integer_power() {
	r := Rational.new(-3, 5)

	assert r.exprational(-2) == Rational.new(25, 9)
}

fn test_raise_a_negative_rational_number_to_an_odd_negative_integer_power() {
	r := Rational.new(-3, 5)

	assert r.exprational(-3) == Rational.new(-125, 27)
}

fn test_raise_zero_to_an_integer_power() {
	r := Rational.new(0, 1)

	assert r.exprational(5) == Rational.new(0, 1)
}

fn test_raise_one_to_an_integer_power() {
	r := Rational.new(1, 1)

	assert r.exprational(4) == Rational.new(1, 1)
}

fn test_raise_a_positive_rational_number_to_the_power_of_zero() {
	r := Rational.new(1, 2)

	assert r.exprational(0) == Rational.new(1, 1)
}

fn test_raise_a_negative_rational_number_to_the_power_of_zero() {
	r := Rational.new(-1, 2)

	assert r.exprational(0) == Rational.new(1, 1)
}

// expreal (n^r)
fn test_raise_a_real_number_to_a_positive_rational_number() {
	r := Rational.new(4, 3)

	assert_close_enough(r.expreal(8), 16.0)
}

fn test_raise_a_real_number_to_a_negative_rational_number() {
	r := Rational.new(-1, 2)

	assert_close_enough(r.expreal(9), 0.33333333333333333)
}

fn test_raise_a_real_number_to_a_zero_rational_number() {
	r := Rational.new(0, 1)

	assert_close_enough(r.expreal(2), 1.0)
}

// reduce

fn test_reduce_a_positive_rational_number_to_lowest_terms() {
	r := Rational.new(2, 4)

	assert r.reduce() == Rational.new(1, 2)
}

fn test_reduce_places_the_minus_sign_on_the_numerator() {
	r := Rational.new(3, -4)

	assert r.reduce() == Rational.new(-3, 4)
}

fn test_reduce_a_negative_rational_number_to_lowest_terms() {
	r := Rational.new(-4, 6)

	assert r.reduce() == Rational.new(-2, 3)
}

fn test_reduce_a_rational_number_with_a_negative_denominator_to_lowest_terms() {
	r := Rational.new(3, -9)

	assert r.reduce() == Rational.new(-1, 3)
}

fn test_reduce_zero_to_lowest_terms() {
	r := Rational.new(0, 6)

	assert r.reduce() == Rational.new(0, 1)
}

fn test_reduce_an_integer_to_lowest_terms() {
	r := Rational.new(-14, 7)

	assert r.reduce() == Rational.new(-2, 1)
}

fn test_reduce_one_to_lowest_terms() {
	r := Rational.new(13, 13)

	assert r.reduce() == Rational.new(1, 1)
}
