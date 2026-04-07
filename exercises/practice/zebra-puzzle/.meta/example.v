module main

import datatypes

struct Constraint {
	updates    Property
	depends_on []Property
	checker    fn (possible_values []int, other_possible_values []int) []int @[required]
}

struct Constraints {
mut:
	all_constraints []Constraint = []
	interests       map[int][]Constraint
}

enum Property {
	// Colors
	red
	green
	ivory
	yellow
	blue
	// Activities
	painting
	dancing
	reading
	football
	chess
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

fn solve() [][]int {
	mut possible_values := [][]int{len: int(Property.end_property), init: [1, 2, 3, 4, 5]}
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
	constraints.same_house(Property.dancing, Property.snails)
	constraints.same_house(Property.snails, Property.dancing)
	constraints.same_house(Property.painting, Property.yellow)
	constraints.same_house(Property.yellow, Property.painting)
	constraints.at_house(Property.milk, 3)
	constraints.at_house(Property.norwegian, 1)
	constraints.is_either_side(Property.reading, Property.fox)
	constraints.is_either_side(Property.fox, Property.reading)
	constraints.is_either_side(Property.painting, Property.horse)
	constraints.is_either_side(Property.horse, Property.painting)
	constraints.same_house(Property.football, Property.orange_juice)
	constraints.same_house(Property.orange_juice, Property.football)
	constraints.same_house(Property.japanese, Property.chess)
	constraints.same_house(Property.chess, Property.japanese)
	constraints.is_either_side(Property.norwegian, Property.blue)
	constraints.is_either_side(Property.blue, Property.norwegian)

	constraints.add_mutually_exclusive_constraints([Property.red, Property.green, Property.ivory,
		Property.yellow, Property.blue])

	constraints.add_mutually_exclusive_constraints([Property.painting, Property.dancing,
		Property.reading, Property.football, Property.chess])

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
			if value in possible_values[property] {
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

fn get_unsolved(possible_values [][]int) !map[int][]int {
	mut unsolved := map[int][]int{}
	for property, values in possible_values {
		if values.len == 0 {
			return error('Empty possible values')
		} else if values.len > 1 {
			unsolved[property] = values
		}
	}

	return unsolved
}

fn (mut c Constraints) add(constraint Constraint) {
	c.all_constraints << constraint
	for _, property_of_interest in constraint.depends_on {
		property_key := int(property_of_interest)
		if property_key !in c.interests {
			c.interests[property_key] = []
		}
		c.interests[property_key] << constraint
	}
}

fn (mut c Constraints) at_house(property Property, house int) {
	c.add(Constraint{
		updates:    property
		depends_on: []
		checker:    fn [house] (possible_values []int, other_possible_values []int) []int {
			return [house]
		}
	})
}

fn (mut c Constraints) same_house(update_property Property, other_property Property) {
	c.add(Constraint{
		updates:    update_property
		depends_on: [other_property]
		checker:    fn (possible_values []int, other_possible_values []int) []int {
			return possible_values.filter(it in other_possible_values)
		}
	})
}

fn (mut c Constraints) is_next_to(update_property Property, other_property Property, offset int) {
	c.add(Constraint{
		updates:    update_property
		depends_on: [other_property]
		checker:    fn [offset] (possible_values []int, other_possible_values []int) []int {
			return possible_values.filter((it - offset) in other_possible_values)
		}
	})
}

fn (mut c Constraints) is_either_side(update_property Property, other_property Property) {
	c.add(Constraint{
		updates:    update_property
		depends_on: [other_property]
		checker:    fn (possible_values []int, other_possible_values []int) []int {
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
		updates:    update_property
		depends_on: [other_property]
		checker:    fn (possible_values []int, other_possible_values []int) []int {
			if other_possible_values.len == 1 {
				return possible_values.filter(it != other_possible_values[0])
			}
			return possible_values
		}
	}
}

fn last_possible_house(update_property Property, other_properties []Property) Constraint {
	return Constraint{
		updates:    update_property
		depends_on: other_properties
		checker:    fn (possible_values []int, other_possible_values []int) []int {
			exclusive := possible_values.filter(it !in other_possible_values)
			if exclusive.len == 1 {
				return exclusive
			}
			return possible_values
		}
	}
}

fn (c Constraints) run(mut possible_values [][]int) {
	mut queue := datatypes.Queue[Constraint]{}
	for constraint in c.all_constraints {
		queue.push(constraint)
	}

	for !queue.is_empty() {
		next := queue.pop() or { return }
		current_values := possible_values[next.updates]
		mut other_values := []int{}
		for other_property in next.depends_on {
			other_values << possible_values[other_property]
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

fn find_who(possible_values [][]int, property Property) string {
	return match possible_values[property] {
		possible_values[Property.englishman] { 'Englishman' }
		possible_values[Property.spaniard] { 'Spaniard' }
		possible_values[Property.ukrainian] { 'Ukrainian' }
		possible_values[Property.norwegian] { 'Norwegian' }
		possible_values[Property.japanese] { 'Japanese' }
		else { panic('Something has gone wrong, could not match house') }
	}
}

fn drinks_water() string {
	return find_who(solve(), Property.water)
}

fn owns_zebra() string {
	return find_who(solve(), Property.zebra)
}
