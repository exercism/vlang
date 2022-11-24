module main

fn is_isosceles(a f64, b f64, c f64) bool {
	mut sides := [a, b, c]
	sides.sort()
	return is_valid_triangle(sides) && (sides[0] == sides[1] || sides[1] == sides[2])
}

fn is_equilateral(a f64, b f64, c f64) bool {
	mut sides := [a, b, c]
	sides.sort()
	return is_valid_triangle(sides) && sides[0] == sides[1] && sides[1] == sides[2]
}

fn is_scalene(a f64, b f64, c f64) bool {
	mut sides := [a, b, c]
	sides.sort()
	return is_valid_triangle(sides) && !is_isosceles(a, b, c) && !is_equilateral(a, b, c)
}

fn is_valid_triangle(sides []f64) bool {
	if sides[0] <= 0 || sides[0]+sides[1] < sides[2] {
		return false
	}
	return true
}