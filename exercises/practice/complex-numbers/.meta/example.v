module main

import math { cos, pow, sin }

struct Complex {
	real      f64
	imaginary f64
}

fn (c Complex) additive(other Complex, op fn (f64, f64) f64) Complex {
	return Complex.new(op(c.real, other.real), op(c.imaginary, other.imaginary))
}

fn (c Complex) reciprocal() Complex {
	denominator := pow(c.real, 2.0) + pow(c.imaginary, 2.0)
	return Complex.new(c.real / denominator, -c.imaginary / denominator)
}

// build a Complex number
pub fn Complex.new(real f64, imaginary f64) Complex {
	return Complex{real, imaginary}
}

pub fn (c Complex) real() f64 {
	return c.real
}

pub fn (c Complex) imaginary() f64 {
	return c.imaginary
}

pub fn (c Complex) conjugate() Complex {
	return Complex.new(c.real, -c.imaginary)
}

pub fn (c Complex) abs() f64 {
	return math.hypot(c.real, c.imaginary)
}

pub fn (c Complex) add(other Complex) Complex {
	return c.additive(other, fn (a f64, b f64) f64 {
		return a + b
	})
}

pub fn (c Complex) sub(other Complex) Complex {
	return c.additive(other, fn (a f64, b f64) f64 {
		return a - b
	})
}

pub fn (c Complex) exp() Complex {
	e_to_creal := math.exp(c.real)
	return Complex.new(e_to_creal * cos(c.imaginary), e_to_creal * sin(c.imaginary))
}

pub fn (c Complex) mul(other Complex) Complex {
	return Complex.new(c.real * other.real - c.imaginary * other.imaginary,
		c.imaginary * other.real + c.real * other.imaginary)
}

pub fn (c Complex) div(other Complex) Complex {
	return c.mul(other.reciprocal())
}

// add a real number 'r' to complex number 'c'
//  c + r
pub fn (c Complex) add_real(r f64) Complex {
	return Complex.new(c.real + r, c.imaginary)
}

// add a complex number 'c' to a real number 'r':
//  r + c
pub fn (c Complex) real_add(r f64) Complex {
	// addition is commutative.
	//   r + c == c + r
	return c.add_real(r)
}

// subtract a real number 'r' from a complex number 'c':
//  c - r
pub fn (c Complex) sub_real(r f64) Complex {
	return c.add_real(-r)
}

// subtract a complex number 'c' from 'r':
//  r - c
pub fn (c Complex) real_sub(r f64) Complex {
	return Complex.new(r - c.real, -c.imaginary)
}

// multiply a complex number 'c' by real number 'r'
//  c * r
pub fn (c Complex) mul_by_real(r f64) Complex {
	return Complex.new(r * c.real, r * c.imaginary)
}

// multiply a real number 'r' by a complex number 'c':
//  r * c
pub fn (c Complex) real_mul(r f64) Complex {
	// multiplication is commutative.
	//   r * c == c * r
	return c.mul_by_real(r)
}

// divide complex number 'c' by real number 'r'
//  c / r
pub fn (c Complex) div_by_real(r f64) Complex {
	return Complex.new(c.real / r, c.imaginary / r)
}

// divide a real number 'r' by a complex number 'c'
//  r / c
pub fn (c Complex) real_div(r f64) Complex {
	return c.reciprocal().mul_by_real(r)
}
