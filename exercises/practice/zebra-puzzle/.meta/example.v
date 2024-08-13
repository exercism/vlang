module main

import datatypes

struct Constraint {
	updates    Property
	depends_on []Property
	checker    fn (possible_values []u8, other_possible_values []u8) []u8 @[required]
}

struct Constraints {
mut:
	all_constraints []Constraint = []
	interests       map[int][]Constraint
}

enum Property as u8 {
	// Colors
	red
	green
	ivory
	yellow
	blue
	// Smokes
	kools
	old_gold
	chesterfields
	lucky_strike
	parliament
	// Drinks
	coffee
	tea
	milk
	orange_juice
	water
	// Nationalities
	englishman
	spaniard
	ukrainian
	norwegian
	japanese
	// Pets
	dog
	fox
	horse
	zebra
	snails
	end_property
}

fn solve() [][]u8 {
	mut possible_values := [][]u8{len: int(Property.end_property), init: [u8(1), 2, 3, 4, 5]}
	mut constraints := Constraints{}

	constraints.same_house(Property.englishman, Property.red)
	constraints.same_house(Property.red, Property.englishman)
	constraints.same_house(Property.spaniard, Property.dog)
	constraints.same_house(Property.dog, Property.spaniard)
	constraints.same_house(Property.coffee, Property.green)
	constraints.same_house(Property.green, Property.coffee)
	constraints.same_house(Property.ukrainian, Property.tea)
	constraints.same_house(Property.tea, Property.ukrainian)
	constraints.is_next_to(Property.green, Property.ivory, 1)
	constraints.is_next_to(Property.ivory, Property.green, -1)
	constraints.same_house(Property.old_gold, Property.snails)
	constraints.same_house(Property.snails, Property.old_gold)
	constraints.same_house(Property.kools, Property.yellow)
	constraints.same_house(Property.yellow, Property.kools)
	constraints.at_house(Property.milk, 3)
	constraints.at_house(Property.norwegian, 1)
	constraints.is_either_side(Property.chesterfields, Property.fox)
	constraints.is_either_side(Property.fox, Property.chesterfields)
	constraints.is_either_side(Property.kools, Property.horse)
	constraints.is_either_side(Property.horse, Property.kools)
	constraints.same_house(Property.lucky_strike, Property.orange_juice)
	constraints.same_house(Property.orange_juice, Property.lucky_strike)
	constraints.same_house(Property.japanese, Property.parliament)
	constraints.same_house(Property.parliament, Property.japanese)
	constraints.is_either_side(Property.norwegian, Property.blue)
	constraints.is_either_side(Property.blue, Property.norwegian)

	constraints.add_mutually_exclusive_constraints([Property.red, Property.green, Property.ivory,
		Property.yellow, Property.blue])

	constraints.add_mutually_exclusive_constraints([Property.kools, Property.old_gold,
		Property.chesterfields, Property.lucky_strike, Property.parliament])

	constraints.add_mutually_exclusive_constraints([Property.coffee, Property.tea, Property.milk,
		Property.orange_juice, Property.water])

	constraints.add_mutually_exclusive_constraints([Property.englishman, Property.spaniard,
		Property.ukrainian, Property.norwegian, Property.japanese])

	constraints.add_mutually_exclusive_constraints([Property.dog, Property.fox, Property.horse,
		Property.zebra, Property.snails])

	constraints.run(mut possible_values)

	to_test := get_unsolved(possible_values) or { panic('Unexpected error') }
	for property, candidates in to_test {
		for value in candidates {
			if value in possible_values[int(property)] {
				mut test_copy := possible_values.clone()
				test_copy[property] = [value]
				constraints.run(mut test_copy)

				remaining := get_unsolved(test_copy) or {
					possible_values[property] = possible_values[property].filter(it != value)
					constraints.run(mut possible_values)
					remaining := get_unsolved(possible_values) or { panic('Unexpected error') }
					if remaining.len == 0 {
						return possible_values
					}
					continue
				}

				if remaining.len == 0 {
					return test_copy
				}
			}
		}
	}

	return possible_values
}

fn get_unsolved(possible_values [][]u8) !map[int][]u8 {
	mut unsolved := map[int][]u8{}
	for property, values in possible_values {
		if values.len == 0 {
			return error('Empty possible values')
		} else if values.len > 1 {
			unsolved[int(property)] = values
		}
	}

	return unsolved
}

fn (mut c Constraints) add(constraint Constraint) {
	c.all_constraints << constraint
	for _, property_of_interest in constraint.depends_on {
		c.interests[int(property_of_interest)] << constraint
	}
}

fn (mut c Constraints) at_house(property Property, house u8) {
	c.add(Constraint{
		updates: property
		depends_on: []
		checker: fn [house] (possible_values []u8, other_possible_values []u8) []u8 {
			return [house]
		}
	})
}

fn (mut c Constraints) same_house(update_property Property, other_property Property) {
	c.add(Constraint{
		updates: update_property
		depends_on: [other_property]
		checker: fn (possible_values []u8, other_possible_values []u8) []u8 {
			return possible_values.filter(it in other_possible_values)
		}
	})
}

fn (mut c Constraints) is_next_to(update_property Property, other_property Property, offset int) {
	c.add(Constraint{
		updates: update_property
		depends_on: [other_property]
		checker: fn [offset] (possible_values []u8, other_possible_values []u8) []u8 {
			return possible_values.filter(u8(int(it) - offset) in other_possible_values)
		}
	})
}

fn (mut c Constraints) is_either_side(update_property Property, other_property Property) {
	c.add(Constraint{
		updates: update_property
		depends_on: [other_property]
		checker: fn (possible_values []u8, other_possible_values []u8) []u8 {
			return possible_values.filter((it + 1) in other_possible_values
				|| (it - 1) in other_possible_values)
		}
	})
}

fn (mut c Constraints) add_mutually_exclusive_constraints(group []Property) {
	for property in group {
		for other in group {
			if property != other {
				c.add(mutually_exclusive(property, other))
			}
		}
		c.add(last_possible_house(property, group.filter(it != property)))
	}
}

fn mutually_exclusive(update_property Property, other_property Property) Constraint {
	return Constraint{
		updates: update_property
		depends_on: [other_property]
		checker: fn (possible_values []u8, other_possible_values []u8) []u8 {
			if other_possible_values.len == 1 {
				return possible_values.filter(it != other_possible_values[0])
			}
			return possible_values
		}
	}
}

fn last_possible_house(update_property Property, other_properties []Property) Constraint {
	return Constraint{
		updates: update_property
		depends_on: other_properties
		checker: fn (possible_values []u8, other_possible_values []u8) []u8 {
			exclusive := possible_values.filter(it !in other_possible_values)
			if exclusive.len == 1 {
				return exclusive
			}
			return possible_values
		}
	}
}

fn (c Constraints) run(mut possible_values [][]u8) {
	mut queue := datatypes.Queue[Constraint]{}
	for constraint in c.all_constraints {
		queue.push(constraint)
	}

	for !queue.is_empty() {
		next := queue.pop() or { return }
		current_values := possible_values[int(next.updates)]
		mut other_values := []u8{}
		for other_property in next.depends_on {
			other_values << possible_values[int(other_property)]
		}

		updated_values := next.checker(current_values, other_values)
		if updated_values != current_values {
			possible_values[next.updates] = updated_values
			for requeue in c.interests[int(next.updates)] {
				if requeue !in queue.array() {
					queue.push(requeue)
				}
			}
		}
	}
}

fn find_who(possible_values [][]u8, property Property) string {
	value := possible_values[int(property)]
	return match value {
		possible_values[int(Property.englishman)] { 'Englishman' }
		possible_values[int(Property.spaniard)] { 'Spaniard' }
		possible_values[int(Property.ukrainian)] { 'Ukrainian' }
		possible_values[int(Property.norwegian)] { 'Norwegian' }
		possible_values[int(Property.japanese)] { 'Japanese' }
		else { panic('Something has gone wrong, could not match house') }
	}
}

fn drinks_water() string {
	return find_who(solve(), Property.water)
}

fn owns_zebra() string {
	return find_who(solve(), Property.zebra)
}
