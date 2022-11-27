module main

fn add_student(roster map[int][]string, name string, grade int) map[int][]string {
	mut new_roster := roster.clone()
	// make sure we aren't adding the same name twice
	for _, names in roster {
		if name in names {
			return roster
		}
	}

	// append the new name and sort
	new_roster[grade] << name
	new_roster[grade].sort()
	return new_roster
}

fn get_students_in_grade(roster map[int][]string, grade int) []string {
	return roster[grade]
}

fn get_all_students(roster map[int][]string) []string {
	mut keys := roster.keys()
	keys.sort()
	mut all_names := []string{}
	for key in keys {
		all_names << roster[key]
	}
	return all_names
}

fn create_new_roster() map[int][]string {
	return map[int][]string{}
}
