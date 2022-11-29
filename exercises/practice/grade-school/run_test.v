module main

fn test_empty_roster() {
	roster := create_new_roster()
	assert get_all_students(roster) == []
}

fn test_roster_one_person() {
	mut roster := create_new_roster()
	roster = add_student(roster, 'Aimee', 1)
	assert get_all_students(roster) == ['Aimee']
}

fn test_roster_three_people() {
	mut roster := create_new_roster()
	roster = add_student(roster, 'Blair', 2)
	roster = add_student(roster, 'James', 2)
	roster = add_student(roster, 'Paul', 2)
	assert get_all_students(roster) == ['Blair', 'James', 'Paul']
}

fn test_roster_duplicate_in_same_grade() {
	mut roster := create_new_roster()
	roster = add_student(roster, 'Blair', 2)
	roster = add_student(roster, 'James', 2)
	roster = add_student(roster, 'James', 2)
	roster = add_student(roster, 'Paul', 2)
	assert get_all_students(roster) == ['Blair', 'James', 'Paul']
}

fn test_cant_have_one_person_in_two_grades() {
	mut roster := create_new_roster()
	roster = add_student(roster, 'Aimee', 1)
	roster = add_student(roster, 'Aimee', 2)
	assert get_students_in_grade(roster, 2) == []
}

fn test_just_one_person_duplicated() {
	mut roster := create_new_roster()
	roster = add_student(roster, 'Aimee', 2)
	roster = add_student(roster, 'Aimee', 2)
	assert get_all_students(roster) == ['Aimee']
}

fn test_students_added_to_multiple_grades() {
	mut roster := create_new_roster()
	roster = add_student(roster, 'Chelsea', 3)
	roster = add_student(roster, 'Logan', 7)
	assert get_all_students(roster) == ['Chelsea', 'Logan']
}

fn test_adding_same_student_multiple_grades() {
	mut roster := create_new_roster()
	roster = add_student(roster, 'Blair', 2)
	roster = add_student(roster, 'James', 2)
	roster = add_student(roster, 'James', 3)
	roster = add_student(roster, 'Paul', 3)
	assert get_all_students(roster) == ['Blair', 'James', 'Paul']
}

fn test_just_one_person_multiple_grades() {
	mut roster := create_new_roster()
	roster = add_student(roster, 'Aimee', 2)
	roster = add_student(roster, 'Aimee', 1)
	assert get_all_students(roster) == ['Aimee']
}

fn test_students_sorted_by_grade() {
	mut roster := create_new_roster()
	roster = add_student(roster, 'Jim', 3)
	roster = add_student(roster, 'Peter', 2)
	roster = add_student(roster, 'Anna', 1)
	assert get_all_students(roster) == ['Anna', 'Peter', 'Jim']
}

fn test_students_sorted_by_name() {
	mut roster := create_new_roster()
	roster = add_student(roster, 'Peter', 2)
	roster = add_student(roster, 'Zoe', 2)
	roster = add_student(roster, 'Alex', 2)
	assert get_all_students(roster) == ['Alex', 'Peter', 'Zoe']
}

fn test_students_sorted_by_grade_then_name() {
	mut roster := create_new_roster()
	roster = add_student(roster, 'Peter', 2)
	roster = add_student(roster, 'Anna', 1)
	roster = add_student(roster, 'Barb', 1)
	roster = add_student(roster, 'Zoe', 2)
	roster = add_student(roster, 'Alex', 2)
	roster = add_student(roster, 'Jim', 3)
	roster = add_student(roster, 'Charlie', 1)
	assert get_all_students(roster) == ['Anna', 'Barb', 'Charlie', 'Alex', 'Peter', 'Zoe', 'Jim']
}

fn test_grade_empty_if_no_students_overall() {
	mut roster := create_new_roster()
	assert get_students_in_grade(roster, 1) == []
}

fn test_grade_empty_if_no_students_in_that_grade() {
	mut roster := create_new_roster()
	roster = add_student(roster, 'Peter', 2)
	roster = add_student(roster, 'Zoe', 2)
	roster = add_student(roster, 'Alex', 2)
	roster = add_student(roster, 'Jim', 3)
	assert get_students_in_grade(roster, 1) == []
}

fn test_adding_same_student_twice_just_query_grade() {
	mut roster := create_new_roster()
	roster = add_student(roster, 'Blair', 2)
	roster = add_student(roster, 'James', 2)
	roster = add_student(roster, 'James', 2)
	roster = add_student(roster, 'Paul', 2)
	assert get_students_in_grade(roster, 2) == ['Blair', 'James', 'Paul']
}

fn test_adding_same_student_two_grades_just_query_grade_2() {
	mut roster := create_new_roster()
	roster = add_student(roster, 'Blair', 2)
	roster = add_student(roster, 'James', 2)
	roster = add_student(roster, 'James', 3)
	roster = add_student(roster, 'Paul', 3)
	assert get_students_in_grade(roster, 2) == ['Blair', 'James']
}

fn test_adding_same_student_two_grades_just_query_grade_3() {
	mut roster := create_new_roster()
	roster = add_student(roster, 'Blair', 2)
	roster = add_student(roster, 'James', 2)
	roster = add_student(roster, 'James', 3)
	roster = add_student(roster, 'Paul', 3)
	assert get_students_in_grade(roster, 3) == ['Paul']
}

fn test_students_sorted_by_name_in_grade() {
	mut roster := create_new_roster()
	roster = add_student(roster, 'Franklin', 5)
	roster = add_student(roster, 'Bradley', 5)
	roster = add_student(roster, 'Jeff', 1)
	assert get_students_in_grade(roster, 5) == ['Bradley', 'Franklin']
}
