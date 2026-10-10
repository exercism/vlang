module main

import math

fn close_enough(a f64, b f64) bool {
	return math.abs(a - b) < 0.01
}

fn test_age_on_earth() {
	if res := age(1000000000, 'Earth') {
		assert close_enough(res, 31.69)
	} else {
		assert false, "age(1000000000, 'Earth') should not return an error"
	}
}

fn test_age_on_mercury() {
	if res := age(2134835688, 'Mercury') {
		assert close_enough(res, 280.88)
	} else {
		assert false, "age(2134835688, 'Mercury') should not return an error"
	}
}

fn test_age_on_venus() {
	if res := age(189839836, 'Venus') {
		assert close_enough(res, 9.78)
	} else {
		assert false, "age(189839836, 'Venus') should not return an error"
	}
}

fn test_age_on_mars() {
	if res := age(2129871239, 'Mars') {
		assert close_enough(res, 35.88)
	} else {
		assert false, "age(2129871239, 'Mars') should not return an error"
	}
}

fn test_age_on_jupiter() {
	if res := age(901876382, 'Jupiter') {
		assert close_enough(res, 2.41)
	} else {
		assert false, "age(901876382, 'Jupiter') should not return an error"
	}
}

fn test_age_on_saturn() {
	if res := age(2000000000, 'Saturn') {
		assert close_enough(res, 2.15)
	} else {
		assert false, "age(2000000000, 'Saturn') should not return an error"
	}
}

fn test_age_on_uranus() {
	if res := age(1210123456, 'Uranus') {
		assert close_enough(res, 0.46)
	} else {
		assert false, "age(1210123456, 'Uranus') should not return an error"
	}
}

fn test_age_on_neptune() {
	if res := age(1821023456, 'Neptune') {
		assert close_enough(res, 0.35)
	} else {
		assert false, "age(1821023456, 'Neptune') should not return an error"
	}
}

fn test_invalid_planet_causes_error() {
	if res := age(680804807, 'Sun') {
		assert false, 'invalid planet causes error should return an error'
	} else {
		assert true
	}
}
