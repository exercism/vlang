module main

fn allergic_to(allergen Allergen, score u8) bool {
	return mask(allergen) & score > 0
}

fn list(score u8) []Allergen {
	return [Allergen.eggs, Allergen.peanuts, Allergen.shellfish, Allergen.strawberries,
		Allergen.tomatoes, Allergen.chocolate, Allergen.pollen, Allergen.cats].filter(score & mask(it) > 0)
}

fn mask(allergen Allergen) u8 {
	return match allergen {
		.eggs { 1 }
		.peanuts { 2 }
		.shellfish { 4 }
		.strawberries { 8 }
		.tomatoes { 16 }
		.chocolate { 32 }
		.pollen { 64 }
		.cats { 128 }
	}
}
