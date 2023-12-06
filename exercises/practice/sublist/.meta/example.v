module main

enum Relation {
	equal
	sublist
	superlist
	unequal
}

fn is_sublist(list_one []int, list_two []int) bool {
	return match true {
		list_two.len < list_one.len { false }
		list_one == list_two[0..list_one.len] { true }
		else { is_sublist(list_one, list_two[1..]) }
	}
}

fn compare(list_one []int, list_two []int) Relation {
	return match true {
		list_one == list_two { .equal }
		is_sublist(list_one, list_two) { .sublist }
		is_sublist(list_two, list_one) { .superlist }
		else { .unequal }
	}
}
