module main

import math { gcd, pow, powi, signi }

struct Rational {
	denominator i64
	numerator   i64
}

// a/b -> b/a
fn (r Rational) invert() Rational {
	return Rational.new(r.numerator, r.denominator)
}

//  a/b -> -a/b
// -a/b ->  a/b
fn (r Rational) negate() Rational {
	return Rational.new(-1 * r.denominator, r.numerator)
}

// build a new Rational number
pub fn Rational.new(denominator i64, numerator i64) Rational {
	assert numerator != 0

	cmn_div := gcd(denominator, numerator)

	sign := if signi(denominator) == -1 || signi(numerator) == -1 {
		-1
	} else {
		1
	}

	return Rational{sign * math.abs(denominator) / cmn_div, math.abs(numerator) / cmn_div}
}

//  a/b -> a/b
// -a/b -> a/b
pub fn (r Rational) abs() Rational {
	return Rational.new(math.abs(r.denominator), math.abs(r.numerator))
}

pub fn (r Rational) add(other Rational) Rational {
	return Rational.new(r.denominator * other.numerator + other.denominator * r.numerator,
		r.numerator * other.numerator)
}

pub fn (r Rational) div(other Rational) Rational {
	return r.mul(other.invert())
}

// r^n
pub fn (r Rational) exprational(n i64) Rational {
	n_pos := math.abs(n)
	result := Rational.new(powi(r.denominator, n_pos), powi(r.numerator, n_pos))

	return match signi(n) {
		1 { result }
		else { result.invert() }
	}
}

// n^r
pub fn (r Rational) expreal(n i64) f64 {
	return pow(n, f64(r.denominator) / f64(r.numerator))
}

pub fn (r Rational) mul(other Rational) Rational {
	return Rational.new(r.denominator * other.denominator, r.numerator * other.numerator)
}

pub fn (r Rational) reduce() Rational {
	return Rational.new(r.denominator, r.numerator)
}

pub fn (r Rational) sub(other Rational) Rational {
	return r.add(other.negate())
}
