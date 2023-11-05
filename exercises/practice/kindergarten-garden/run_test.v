module main

fn test_partial_garden__garden_with_single_student() {
	diagram := 'RC\nGG'
	expect := ['radishes', 'clover', 'grass', 'grass']
	assert plants(diagram, 'Alice') == expect
}

fn test_partial_garden__different_garden_with_single_student() {
	diagram := 'VC\nRC'
	expect := ['violets', 'clover', 'radishes', 'clover']
	assert plants(diagram, 'Alice') == expect
}

fn test_partial_garden__garden_with_two_students() {
	diagram := 'VVCG\nVVRC'
	expect := ['clover', 'grass', 'radishes', 'clover']
	assert plants(diagram, 'Bob') == expect
}

fn test_partial_garden__multiple_students_for_the_same_garden_with_three_students__second_students_garden() {
	diagram := 'VVCCGG\nVVCCGG'
	expect := ['clover', 'clover', 'clover', 'clover']
	assert plants(diagram, 'Bob') == expect
}

fn test_partial_garden__multiple_students_for_the_same_garden_with_three_students__third_students_garden() {
	diagram := 'VVCCGG\nVVCCGG'
	expect := ['grass', 'grass', 'grass', 'grass']
	assert plants(diagram, 'Charlie') == expect
}

fn test_full_garden__for_alice_first_students_garden() {
	diagram := 'VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV'
	expect := ['violets', 'radishes', 'violets', 'radishes']
	assert plants(diagram, 'Alice') == expect
}

fn test_full_garden__for_bob_second_students_garden() {
	diagram := 'VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV'
	expect := ['clover', 'grass', 'clover', 'clover']
	assert plants(diagram, 'Bob') == expect
}

fn test_full_garden__for_charlie() {
	diagram := 'VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV'
	expect := ['violets', 'violets', 'clover', 'grass']
	assert plants(diagram, 'Charlie') == expect
}

fn test_full_garden__for_david() {
	diagram := 'VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV'
	expect := ['radishes', 'violets', 'clover', 'radishes']
	assert plants(diagram, 'David') == expect
}

fn test_full_garden__for_eve() {
	diagram := 'VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV'
	expect := ['clover', 'grass', 'radishes', 'grass']
	assert plants(diagram, 'Eve') == expect
}

fn test_full_garden__for_fred() {
	diagram := 'VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV'
	expect := ['grass', 'clover', 'violets', 'clover']
	assert plants(diagram, 'Fred') == expect
}

fn test_full_garden__for_ginny() {
	diagram := 'VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV'
	expect := ['clover', 'grass', 'grass', 'clover']
	assert plants(diagram, 'Ginny') == expect
}

fn test_full_garden__for_harriet() {
	diagram := 'VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV'
	expect := ['violets', 'radishes', 'radishes', 'violets']
	assert plants(diagram, 'Harriet') == expect
}

fn test_full_garden__for_ileana() {
	diagram := 'VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV'
	expect := ['grass', 'clover', 'violets', 'clover']
	assert plants(diagram, 'Ileana') == expect
}

fn test_full_garden__for_joseph() {
	diagram := 'VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV'
	expect := ['violets', 'clover', 'violets', 'grass']
	assert plants(diagram, 'Joseph') == expect
}

fn test_full_garden__for_kincaid_second_to_last_students_garden() {
	diagram := 'VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV'
	expect := ['grass', 'clover', 'clover', 'grass']
	assert plants(diagram, 'Kincaid') == expect
}

fn test_full_garden__for_larry_last_students_garden() {
	diagram := 'VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV'
	expect := ['grass', 'violets', 'clover', 'violets']
	assert plants(diagram, 'Larry') == expect
}
