module main

import math { gcd, pow, powi, signi }

struct Rational {
	numerator   i64
	denominator i64
}

// a/b -> b/a
fn (r Rational) invert() Rational {
	return Rational.new(r.denominator, r.numerator)
}

//  a/b -> -a/b
// -a/b ->  a/b
fn (r Rational) negate() Rational {
	return Rational.new(-1 * r.numerator, r.denominator)
}

// build a new Rational number
pub fn Rational.new(numerator i64, denominator i64) Rational {
	assert denominator != 0

	cmn_div := gcd(numerator, denominator)

	sign := if signi(numerator) == -1 || signi(denominator) == -1 {
		-1
	} else {
		1
	}

	return Rational{sign * math.abs(numerator) / cmn_div, math.abs(denominator) / cmn_div}
}

//  a/b -> a/b
// -a/b -> a/b
pub fn (r Rational) abs() Rational {
	return Rational.new(math.abs(r.numerator), math.abs(r.denominator))
}

pub fn (r Rational) add(other Rational) Rational {
	return Rational.new(r.numerator * other.denominator + other.numerator * r.denominator,
		r.denominator * other.denominator)
}

pub fn (r Rational) div(other Rational) Rational {
	return r.mul(other.invert())
}

// r^n
pub fn (r Rational) exprational(n i64) Rational {
	n_pos := math.abs(n)
	result := Rational.new(powi(r.numerator, n_pos), powi(r.denominator, n_pos))

	return match signi(n) {
		1 { result }
		else { result.invert() }
	}
}

// n^r
pub fn (r Rational) expreal(n i64) f64 {
	return pow(n, f64(r.numerator) / f64(r.denominator))
}

pub fn (r Rational) mul(other Rational) Rational {
	return Rational.new(r.numerator * other.numerator, r.denominator * other.denominator)
}

pub fn (r Rational) reduce() Rational {
	return Rational.new(r.numerator, r.denominator)
}

pub fn (r Rational) sub(other Rational) Rational {
	return r.add(other.negate())
}
