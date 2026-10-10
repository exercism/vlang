module main

fn to_int(allergen Allergen) int {
	return int(allergen)
}

fn same_in_any_order(left []Allergen, right []Allergen) bool {
	return left.map(to_int).sorted() == right.map(to_int).sorted()
}

fn test_eggs_allergy__not_allergic_to_anything() {
	assert !allergic_to(Allergen.eggs, 0)
}

fn test_eggs_allergy__allergic_only_to_eggs() {
	assert allergic_to(Allergen.eggs, 1)
}

fn test_eggs_allergy__allergic_to_eggs_and_something_else() {
	assert allergic_to(Allergen.eggs, 3)
}

fn test_eggs_allergy__allergic_to_something_but_not_eggs() {
	assert !allergic_to(Allergen.eggs, 2)
}

fn test_eggs_allergy__allergic_to_everything() {
	assert allergic_to(Allergen.eggs, 255)
}

fn test_peanuts_allergy__not_allergic_to_anything() {
	assert !allergic_to(Allergen.peanuts, 0)
}

fn test_peanuts_allergy__allergic_only_to_peanuts() {
	assert allergic_to(Allergen.peanuts, 2)
}

fn test_peanuts_allergy__allergic_to_peanuts_and_something_else() {
	assert allergic_to(Allergen.peanuts, 7)
}

fn test_peanuts_allergy__allergic_to_something_but_not_peanuts() {
	assert !allergic_to(Allergen.peanuts, 5)
}

fn test_peanuts_allergy__allergic_to_everything() {
	assert allergic_to(Allergen.peanuts, 255)
}

fn test_shellfish_allergy__not_allergic_to_anything() {
	assert !allergic_to(Allergen.shellfish, 0)
}

fn test_shellfish_allergy__allergic_only_to_shellfish() {
	assert allergic_to(Allergen.shellfish, 4)
}

fn test_shellfish_allergy__allergic_to_shellfish_and_something_else() {
	assert allergic_to(Allergen.shellfish, 14)
}

fn test_shellfish_allergy__allergic_to_something_but_not_shellfish() {
	assert !allergic_to(Allergen.shellfish, 10)
}

fn test_shellfish_allergy__allergic_to_everything() {
	assert allergic_to(Allergen.shellfish, 255)
}

fn test_strawberries_allergy__not_allergic_to_anything() {
	assert !allergic_to(Allergen.strawberries, 0)
}

fn test_strawberries_allergy__allergic_only_to_strawberries() {
	assert allergic_to(Allergen.strawberries, 8)
}

fn test_strawberries_allergy__allergic_to_strawberries_and_something_else() {
	assert allergic_to(Allergen.strawberries, 28)
}

fn test_strawberries_allergy__allergic_to_something_but_not_strawberries() {
	assert !allergic_to(Allergen.strawberries, 20)
}

fn test_strawberries_allergy__allergic_to_everything() {
	assert allergic_to(Allergen.strawberries, 255)
}

fn test_tomatoes_allergy__not_allergic_to_anything() {
	assert !allergic_to(Allergen.tomatoes, 0)
}

fn test_tomatoes_allergy__allergic_only_to_tomatoes() {
	assert allergic_to(Allergen.tomatoes, 16)
}

fn test_tomatoes_allergy__allergic_to_tomatoes_and_something_else() {
	assert allergic_to(Allergen.tomatoes, 56)
}

fn test_tomatoes_allergy__allergic_to_something_but_not_tomatoes() {
	assert !allergic_to(Allergen.tomatoes, 40)
}

fn test_tomatoes_allergy__allergic_to_everything() {
	assert allergic_to(Allergen.tomatoes, 255)
}

fn test_chocolate_allergy__not_allergic_to_anything() {
	assert !allergic_to(Allergen.chocolate, 0)
}

fn test_chocolate_allergy__allergic_only_to_chocolate() {
	assert allergic_to(Allergen.chocolate, 32)
}

fn test_chocolate_allergy__allergic_to_chocolate_and_something_else() {
	assert allergic_to(Allergen.chocolate, 112)
}

fn test_chocolate_allergy__allergic_to_something_but_not_chocolate() {
	assert !allergic_to(Allergen.chocolate, 80)
}

fn test_chocolate_allergy__allergic_to_everything() {
	assert allergic_to(Allergen.chocolate, 255)
}

fn test_pollen_allergy__not_allergic_to_anything() {
	assert !allergic_to(Allergen.pollen, 0)
}

fn test_pollen_allergy__allergic_only_to_pollen() {
	assert allergic_to(Allergen.pollen, 64)
}

fn test_pollen_allergy__allergic_to_pollen_and_something_else() {
	assert allergic_to(Allergen.pollen, 224)
}

fn test_pollen_allergy__allergic_to_something_but_not_pollen() {
	assert !allergic_to(Allergen.pollen, 160)
}

fn test_pollen_allergy__allergic_to_everything() {
	assert allergic_to(Allergen.pollen, 255)
}

fn test_cats_allergy__not_allergic_to_anything() {
	assert !allergic_to(Allergen.cats, 0)
}

fn test_cats_allergy__allergic_only_to_cats() {
	assert allergic_to(Allergen.cats, 128)
}

fn test_cats_allergy__allergic_to_cats_and_something_else() {
	assert allergic_to(Allergen.cats, 192)
}

fn test_cats_allergy__allergic_to_something_but_not_cats() {
	assert !allergic_to(Allergen.cats, 64)
}

fn test_cats_allergy__allergic_to_everything() {
	assert allergic_to(Allergen.cats, 255)
}

fn test_list__no_allergies() {
	assert list(0) == []
}

fn test_list__just_eggs() {
	assert list(1) == [Allergen.eggs]
}

fn test_list__just_peanuts() {
	assert list(2) == [Allergen.peanuts]
}

fn test_list__just_strawberries() {
	assert list(8) == [Allergen.strawberries]
}

fn test_list__eggs_and_peanuts() {
	assert same_in_any_order(list(3), [Allergen.eggs, Allergen.peanuts])
}

fn test_list__more_than_eggs_but_not_peanuts() {
	assert same_in_any_order(list(5), [Allergen.eggs, Allergen.shellfish])
}

fn test_list__lots_of_stuff() {
	assert same_in_any_order(list(248), [Allergen.strawberries, Allergen.tomatoes, Allergen.chocolate,
		Allergen.pollen, Allergen.cats])
}

fn test_list__everything() {
	assert same_in_any_order(list(255), [Allergen.eggs, Allergen.peanuts, Allergen.shellfish,
		Allergen.strawberries, Allergen.tomatoes, Allergen.chocolate, Allergen.pollen, Allergen.cats])
}
