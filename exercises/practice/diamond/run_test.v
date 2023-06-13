module main

fn test_degenerate_case_with_a_single_a_row() {
	expected := [
		'A',
	]
	assert rows(`A`) == expected
}

fn test_degenerate_case_with_no_row_containing_3_distinct_groups_of_spaces() {
	expected := [
		' A ',
		'B B',
		' A ',
	]
	assert rows(`B`) == expected
}

fn test_smallest_non_degenerate_case_with_odd_diamond_side_length() {
	expected := [
		'  A  ',
		' B B ',
		'C   C',
		' B B ',
		'  A  ',
	]
	assert rows(`C`) == expected
}

fn test_smallest_non_degenerate_case_with_even_diamond_side_length() {
	expected := [
		'   A   ',
		'  B B  ',
		' C   C ',
		'D     D',
		' C   C ',
		'  B B  ',
		'   A   ',
	]
	assert rows(`D`) == expected
}

fn test_largest_possible_diamond() {
	expected := [
		'                         A                         ',
		'                        B B                        ',
		'                       C   C                       ',
		'                      D     D                      ',
		'                     E       E                     ',
		'                    F         F                    ',
		'                   G           G                   ',
		'                  H             H                  ',
		'                 I               I                 ',
		'                J                 J                ',
		'               K                   K               ',
		'              L                     L              ',
		'             M                       M             ',
		'            N                         N            ',
		'           O                           O           ',
		'          P                             P          ',
		'         Q                               Q         ',
		'        R                                 R        ',
		'       S                                   S       ',
		'      T                                     T      ',
		'     U                                       U     ',
		'    V                                         V    ',
		'   W                                           W   ',
		'  X                                             X  ',
		' Y                                               Y ',
		'Z                                                 Z',
		' Y                                               Y ',
		'  X                                             X  ',
		'   W                                           W   ',
		'    V                                         V    ',
		'     U                                       U     ',
		'      T                                     T      ',
		'       S                                   S       ',
		'        R                                 R        ',
		'         Q                               Q         ',
		'          P                             P          ',
		'           O                           O           ',
		'            N                         N            ',
		'             M                       M             ',
		'              L                     L              ',
		'               K                   K               ',
		'                J                 J                ',
		'                 I               I                 ',
		'                  H             H                  ',
		'                   G           G                   ',
		'                    F         F                    ',
		'                     E       E                     ',
		'                      D     D                      ',
		'                       C   C                       ',
		'                        B B                        ',
		'                         A                         ',
	]
	assert rows(`Z`) == expected
}
