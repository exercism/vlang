module main

import regex

fn test_robots_named_properly() {
	mut robots := create_robot_storage()
	r := create_robot(mut robots)
	query := r'^\A{2}\d{3}$'
	mut re := regex.regex_opt(query) or { panic(err) }
	assert re.matches_string(r.name)
}

fn test_robots_keep_same_name() {
	mut robots := create_robot_storage()
	r1 := create_robot(mut robots)
	name1 := r1.name
	r2 := create_robot(mut robots)
	name2 := r1.name
	assert name1 == name2
}

fn test_reset_robots_named_properly() {
	mut robots := create_robot_storage()
	mut r := create_robot(mut robots)
	r.reset(mut robots)
	query := r'^\A{2}\d{3}$'
	mut re := regex.regex_opt(query) or { panic(err) }
	assert re.matches_string(r.name)
}

fn test_reset_robots_change_name() {
	mut robots := create_robot_storage()
	mut r := create_robot(mut robots)
	first_name := r.name
	r.reset(mut robots)
	second_name := r.name
	assert first_name != second_name
}

fn test_lots_of_robots_have_different_names() {
	mut robots := create_robot_storage()
	mut names := []string{}
	for _ in 0 .. 1000 {
		r := create_robot(mut robots)
		if r.name !in names {
			names << r.name
		} else {
			assert false, "${r.name} found multiple times! that's not allowed"
		}
	}
	assert true
}
