module main

import math

fn close_enough(a f64, b f64) bool {
	return math.abs(a - b) < 0.01
}

fn test_age_on_mercury(){
	assert close_enough(age(2134835688, "Mercury")!, 280.88)
}

fn test_age_on_venus(){
	assert close_enough(age(189839836, "Venus")!, 9.78)
}

fn test_age_on_earth(){
	assert close_enough(age(1000000000, "Earth")!, 31.69)
}

fn test_age_on_mars(){
	assert close_enough(age(2129871239, "Mars")!, 35.88)
}

fn test_age_on_jupiter(){
	assert close_enough(age(901876382, "Jupiter")!, 2.41)
}

fn test_age_on_saturn(){
	assert close_enough(age(2000000000, "Saturn")!, 2.15)
}

fn test_age_on_uranus(){
	assert close_enough(age(1210123456, "Uranus")!, 0.46)
}

fn test_age_on_neptune(){
	assert close_enough(age(1821023456, "Neptune")!, 0.35)
}

fn test_age_on_sun(){
	if res := age(680804807, "Sun") {
		assert false, "trying to find age on the sun should return an error"
	} else {
		assert err.msg() == "Sun is not a valid planet"
	}
}