module main

fn earth_years(seconds f64) f64 {
	return seconds / 31557600
}

fn age(seconds f64, planet string) !f64 {
	orbital_period := match planet {
		"Mercury" { 0.2408467} 
		"Venus" { 0.61519726 }
		"Earth" { 1.0 }
		"Mars" { 1.8808158 }
		"Jupiter" { 11.862615 }
		"Saturn" { 29.447498 }
		"Uranus" { 84.016846 }
		"Neptune" { 164.79132 }
		else { -1 }
	}
	planet_age := earth_years(seconds) / orbital_period
	if planet_age < 0 {
		return error("$planet is not a valid planet")
	}
	return planet_age
}