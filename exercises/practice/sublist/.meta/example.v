module main

enum Relation {
	equal
	sublist
	superlist
	unequal
}

fn is_sublist(list_one []int, list_two []int) bool {
	if list_two.len < list_one.len {
		return false
	} else if list_one == list_two[0..list_one.len] {
		return true
	} else {
		return is_sublist(list_one, list_two[1..])
	}
}

fn compare(list_one []int, list_two []int) Relation {
	if list_one == list_two {
		return .equal
	} else if is_sublist(list_one, list_two) {
		return .sublist
	} else if is_sublist(list_two, list_one) {
		return .superlist
	} else {
		return .unequal
	}
}
