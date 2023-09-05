module main

struct Complex {
}

// build a Complex number
pub fn Complex.new(real f64, imaginary f64) Complex {
}

pub fn (c Complex) real() f64 {
}

pub fn (c Complex) imaginary() f64 {
}

pub fn (c Complex) conjugate() Complex {
}

pub fn (c Complex) abs() f64 {
}

pub fn (c Complex) add(other Complex) Complex {
}

pub fn (c Complex) sub(other Complex) Complex {
}

pub fn (c Complex) exp() Complex {
}

pub fn (c Complex) mul(other Complex) Complex {
}

pub fn (c Complex) div(other Complex) Complex {
}

// add a real number 'r' to complex number 'c'
//  c + r
pub fn (c Complex) add_real(r f64) Complex {
}

// add a complex number 'c' to a real number 'r':
//  r + c
pub fn (c Complex) real_add(r f64) Complex {
}

// subtract a real number 'r' from a complex number 'c':
//  c - r
pub fn (c Complex) sub_real(r f64) Complex {
}

// subtract a complex number 'c' from 'r':
//  r - c
pub fn (c Complex) real_sub(r f64) Complex {
}

// multiply a complex number 'c' by real number 'r'
//  c * r
pub fn (c Complex) mul_by_real(r f64) Complex {
}

// multiply a real number 'r' by a complex number 'c':
//  r * c
pub fn (c Complex) real_mul(r f64) Complex {
}

// divide complex number 'c' by real number 'r'
//  c / r
pub fn (c Complex) div_by_real(r f64) Complex {
}

// divide a real number 'r' by a complex number 'c'
//  r / c
pub fn (c Complex) real_div(r f64) Complex {
}
