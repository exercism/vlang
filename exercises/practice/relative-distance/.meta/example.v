module main

fn degree_of_separation(family_tree map[string][]string, person_a string, person_b string) !int {
	if person_a == person_b {
		return 0
	}

	mut relations := map[string][]string{}
	for parent, kids in family_tree {
		for child in kids {
			connect(mut relations, parent, child)
			connect(mut relations, child, parent)
		}
		for first in 0 .. kids.len {
			for second in first + 1 .. kids.len {
				connect(mut relations, kids[first], kids[second])
				connect(mut relations, kids[second], kids[first])
			}
		}
	}

	mut seen := map[string]bool{}
	seen[person_a] = true
	mut frontier := [person_a]
	mut distance := 0

	for frontier.len > 0 {
		mut next_frontier := []string{}
		for person in frontier {
			relatives := relations[person] or { []string{} }
			for relative in relatives {
				if relative == person_b {
					return distance + 1
				}
				if !seen[relative] {
					seen[relative] = true
					next_frontier << relative
				}
			}
		}
		distance++
		frontier = next_frontier.clone()
	}

	return error('${person_a} and ${person_b} have no known relationship')
}

fn connect(mut relations map[string][]string, one string, other string) {
	mut existing := relations[one] or { []string{} }
	existing << other
	relations[one] = existing
}
