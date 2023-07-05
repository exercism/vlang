module main

fn test_should_accept_an_initial_game_grid_and_a_target_search_word() {
	grid := [
		'jefblpepre',
	]
	words_to_search_for := [
		'clojure',
	]
	expected := {
		'clojure': ?WordLocation(none)
	}
	assert search(grid, words_to_search_for) == expected
}

fn test_should_locate_one_word_written_left_to_right() {
	grid := [
		'clojurermt',
	]
	words_to_search_for := [
		'clojure',
	]
	expected := {
		'clojure': ?WordLocation{
			start: Pair{
				column: 1
				row: 1
			}
			end: Pair{
				column: 7
				row: 1
			}
		}
	}
	assert search(grid, words_to_search_for) == expected
}

fn test_should_locate_the_same_word_written_left_to_right_in_a_different_position() {
	grid := [
		'mtclojurer',
	]
	words_to_search_for := [
		'clojure',
	]
	expected := {
		'clojure': ?WordLocation{
			start: Pair{
				column: 3
				row: 1
			}
			end: Pair{
				column: 9
				row: 1
			}
		}
	}
	assert search(grid, words_to_search_for) == expected
}

fn test_should_locate_a_different_left_to_right_word() {
	grid := [
		'coffeelplx',
	]
	words_to_search_for := [
		'coffee',
	]
	expected := {
		'coffee': ?WordLocation{
			start: Pair{
				column: 1
				row: 1
			}
			end: Pair{
				column: 6
				row: 1
			}
		}
	}
	assert search(grid, words_to_search_for) == expected
}

fn test_should_locate_that_different_left_to_right_word_in_a_different_position() {
	grid := [
		'xcoffeezlp',
	]
	words_to_search_for := [
		'coffee',
	]
	expected := {
		'coffee': ?WordLocation{
			start: Pair{
				column: 2
				row: 1
			}
			end: Pair{
				column: 7
				row: 1
			}
		}
	}
	assert search(grid, words_to_search_for) == expected
}

fn test_should_locate_a_left_to_right_word_in_two_line_grid() {
	grid := [
		'jefblpepre',
		'tclojurerm',
	]
	words_to_search_for := [
		'clojure',
	]
	expected := {
		'clojure': ?WordLocation{
			start: Pair{
				column: 2
				row: 2
			}
			end: Pair{
				column: 8
				row: 2
			}
		}
	}
	assert search(grid, words_to_search_for) == expected
}

fn test_should_locate_a_left_to_right_word_in_three_line_grid() {
	grid := [
		'camdcimgtc',
		'jefblpepre',
		'clojurermt',
	]
	words_to_search_for := [
		'clojure',
	]
	expected := {
		'clojure': ?WordLocation{
			start: Pair{
				column: 1
				row: 3
			}
			end: Pair{
				column: 7
				row: 3
			}
		}
	}
	assert search(grid, words_to_search_for) == expected
}

fn test_should_locate_a_left_to_right_word_in_ten_line_grid() {
	grid := [
		'jefblpepre',
		'camdcimgtc',
		'oivokprjsm',
		'pbwasqroua',
		'rixilelhrs',
		'wolcqlirpc',
		'screeaumgr',
		'alxhpburyi',
		'jalaycalmp',
		'clojurermt',
	]
	words_to_search_for := [
		'clojure',
	]
	expected := {
		'clojure': ?WordLocation{
			start: Pair{
				column: 1
				row: 10
			}
			end: Pair{
				column: 7
				row: 10
			}
		}
	}
	assert search(grid, words_to_search_for) == expected
}

fn test_should_locate_that_left_to_right_word_in_a_different_position_in_a_ten_line_grid() {
	grid := [
		'jefblpepre',
		'camdcimgtc',
		'oivokprjsm',
		'pbwasqroua',
		'rixilelhrs',
		'wolcqlirpc',
		'screeaumgr',
		'alxhpburyi',
		'clojurermt',
		'jalaycalmp',
	]
	words_to_search_for := [
		'clojure',
	]
	expected := {
		'clojure': ?WordLocation{
			start: Pair{
				column: 1
				row: 9
			}
			end: Pair{
				column: 7
				row: 9
			}
		}
	}
	assert search(grid, words_to_search_for) == expected
}

fn test_should_locate_a_different_left_to_right_word_in_a_ten_line_grid() {
	grid := [
		'jefblpepre',
		'camdcimgtc',
		'oivokprjsm',
		'pbwasqroua',
		'rixilelhrs',
		'wolcqlirpc',
		'fortranftw',
		'alxhpburyi',
		'clojurermt',
		'jalaycalmp',
	]
	words_to_search_for := [
		'fortran',
	]
	expected := {
		'fortran': ?WordLocation{
			start: Pair{
				column: 1
				row: 7
			}
			end: Pair{
				column: 7
				row: 7
			}
		}
	}
	assert search(grid, words_to_search_for) == expected
}

fn test_should_locate_multiple_words() {
	grid := [
		'jefblpepre',
		'camdcimgtc',
		'oivokprjsm',
		'pbwasqroua',
		'rixilelhrs',
		'wolcqlirpc',
		'fortranftw',
		'alxhpburyi',
		'jalaycalmp',
		'clojurermt',
	]
	words_to_search_for := [
		'fortran',
		'clojure',
	]
	expected := {
		'clojure': ?WordLocation{
			start: Pair{
				column: 1
				row: 10
			}
			end: Pair{
				column: 7
				row: 10
			}
		}
		'fortran': ?WordLocation{
			start: Pair{
				column: 1
				row: 7
			}
			end: Pair{
				column: 7
				row: 7
			}
		}
	}
	assert search(grid, words_to_search_for) == expected
}

fn test_should_locate_a_single_word_written_right_to_left() {
	grid := [
		'rixilelhrs',
	]
	words_to_search_for := [
		'elixir',
	]
	expected := {
		'elixir': ?WordLocation{
			start: Pair{
				column: 6
				row: 1
			}
			end: Pair{
				column: 1
				row: 1
			}
		}
	}
	assert search(grid, words_to_search_for) == expected
}

fn test_should_locate_multiple_words_written_in_different_horizontal_directions() {
	grid := [
		'jefblpepre',
		'camdcimgtc',
		'oivokprjsm',
		'pbwasqroua',
		'rixilelhrs',
		'wolcqlirpc',
		'screeaumgr',
		'alxhpburyi',
		'jalaycalmp',
		'clojurermt',
	]
	words_to_search_for := [
		'elixir',
		'clojure',
	]
	expected := {
		'clojure': ?WordLocation{
			start: Pair{
				column: 1
				row: 10
			}
			end: Pair{
				column: 7
				row: 10
			}
		}
		'elixir':  ?WordLocation{
			start: Pair{
				column: 6
				row: 5
			}
			end: Pair{
				column: 1
				row: 5
			}
		}
	}
	assert search(grid, words_to_search_for) == expected
}

fn test_should_locate_words_written_top_to_bottom() {
	grid := [
		'jefblpepre',
		'camdcimgtc',
		'oivokprjsm',
		'pbwasqroua',
		'rixilelhrs',
		'wolcqlirpc',
		'screeaumgr',
		'alxhpburyi',
		'jalaycalmp',
		'clojurermt',
	]
	words_to_search_for := [
		'clojure',
		'elixir',
		'ecmascript',
	]
	expected := {
		'clojure':    ?WordLocation{
			start: Pair{
				column: 1
				row: 10
			}
			end: Pair{
				column: 7
				row: 10
			}
		}
		'elixir':     ?WordLocation{
			start: Pair{
				column: 6
				row: 5
			}
			end: Pair{
				column: 1
				row: 5
			}
		}
		'ecmascript': ?WordLocation{
			start: Pair{
				column: 10
				row: 1
			}
			end: Pair{
				column: 10
				row: 10
			}
		}
	}
	assert search(grid, words_to_search_for) == expected
}

fn test_should_locate_words_written_bottom_to_top() {
	grid := [
		'jefblpepre',
		'camdcimgtc',
		'oivokprjsm',
		'pbwasqroua',
		'rixilelhrs',
		'wolcqlirpc',
		'screeaumgr',
		'alxhpburyi',
		'jalaycalmp',
		'clojurermt',
	]
	words_to_search_for := [
		'clojure',
		'elixir',
		'ecmascript',
		'rust',
	]
	expected := {
		'clojure':    ?WordLocation{
			start: Pair{
				column: 1
				row: 10
			}
			end: Pair{
				column: 7
				row: 10
			}
		}
		'elixir':     ?WordLocation{
			start: Pair{
				column: 6
				row: 5
			}
			end: Pair{
				column: 1
				row: 5
			}
		}
		'ecmascript': ?WordLocation{
			start: Pair{
				column: 10
				row: 1
			}
			end: Pair{
				column: 10
				row: 10
			}
		}
		'rust':       ?WordLocation{
			start: Pair{
				column: 9
				row: 5
			}
			end: Pair{
				column: 9
				row: 2
			}
		}
	}
	assert search(grid, words_to_search_for) == expected
}

fn test_should_locate_words_written_top_left_to_bottom_right() {
	grid := [
		'jefblpepre',
		'camdcimgtc',
		'oivokprjsm',
		'pbwasqroua',
		'rixilelhrs',
		'wolcqlirpc',
		'screeaumgr',
		'alxhpburyi',
		'jalaycalmp',
		'clojurermt',
	]
	words_to_search_for := [
		'clojure',
		'elixir',
		'ecmascript',
		'rust',
		'java',
	]
	expected := {
		'clojure':    ?WordLocation{
			start: Pair{
				column: 1
				row: 10
			}
			end: Pair{
				column: 7
				row: 10
			}
		}
		'elixir':     ?WordLocation{
			start: Pair{
				column: 6
				row: 5
			}
			end: Pair{
				column: 1
				row: 5
			}
		}
		'ecmascript': ?WordLocation{
			start: Pair{
				column: 10
				row: 1
			}
			end: Pair{
				column: 10
				row: 10
			}
		}
		'rust':       ?WordLocation{
			start: Pair{
				column: 9
				row: 5
			}
			end: Pair{
				column: 9
				row: 2
			}
		}
		'java':       ?WordLocation{
			start: Pair{
				column: 1
				row: 1
			}
			end: Pair{
				column: 4
				row: 4
			}
		}
	}
	assert search(grid, words_to_search_for) == expected
}

fn test_should_locate_words_written_bottom_right_to_top_left() {
	grid := [
		'jefblpepre',
		'camdcimgtc',
		'oivokprjsm',
		'pbwasqroua',
		'rixilelhrs',
		'wolcqlirpc',
		'screeaumgr',
		'alxhpburyi',
		'jalaycalmp',
		'clojurermt',
	]
	words_to_search_for := [
		'clojure',
		'elixir',
		'ecmascript',
		'rust',
		'java',
		'lua',
	]
	expected := {
		'clojure':    ?WordLocation{
			start: Pair{
				column: 1
				row: 10
			}
			end: Pair{
				column: 7
				row: 10
			}
		}
		'elixir':     ?WordLocation{
			start: Pair{
				column: 6
				row: 5
			}
			end: Pair{
				column: 1
				row: 5
			}
		}
		'ecmascript': ?WordLocation{
			start: Pair{
				column: 10
				row: 1
			}
			end: Pair{
				column: 10
				row: 10
			}
		}
		'rust':       ?WordLocation{
			start: Pair{
				column: 9
				row: 5
			}
			end: Pair{
				column: 9
				row: 2
			}
		}
		'java':       ?WordLocation{
			start: Pair{
				column: 1
				row: 1
			}
			end: Pair{
				column: 4
				row: 4
			}
		}
		'lua':        ?WordLocation{
			start: Pair{
				column: 8
				row: 9
			}
			end: Pair{
				column: 6
				row: 7
			}
		}
	}
	assert search(grid, words_to_search_for) == expected
}

fn test_should_locate_words_written_bottom_left_to_top_right() {
	grid := [
		'jefblpepre',
		'camdcimgtc',
		'oivokprjsm',
		'pbwasqroua',
		'rixilelhrs',
		'wolcqlirpc',
		'screeaumgr',
		'alxhpburyi',
		'jalaycalmp',
		'clojurermt',
	]
	words_to_search_for := [
		'clojure',
		'elixir',
		'ecmascript',
		'rust',
		'java',
		'lua',
		'lisp',
	]
	expected := {
		'clojure':    ?WordLocation{
			start: Pair{
				column: 1
				row: 10
			}
			end: Pair{
				column: 7
				row: 10
			}
		}
		'elixir':     ?WordLocation{
			start: Pair{
				column: 6
				row: 5
			}
			end: Pair{
				column: 1
				row: 5
			}
		}
		'ecmascript': ?WordLocation{
			start: Pair{
				column: 10
				row: 1
			}
			end: Pair{
				column: 10
				row: 10
			}
		}
		'rust':       ?WordLocation{
			start: Pair{
				column: 9
				row: 5
			}
			end: Pair{
				column: 9
				row: 2
			}
		}
		'java':       ?WordLocation{
			start: Pair{
				column: 1
				row: 1
			}
			end: Pair{
				column: 4
				row: 4
			}
		}
		'lua':        ?WordLocation{
			start: Pair{
				column: 8
				row: 9
			}
			end: Pair{
				column: 6
				row: 7
			}
		}
		'lisp':       ?WordLocation{
			start: Pair{
				column: 3
				row: 6
			}
			end: Pair{
				column: 6
				row: 3
			}
		}
	}
	assert search(grid, words_to_search_for) == expected
}

fn test_should_locate_words_written_top_right_to_bottom_left() {
	grid := [
		'jefblpepre',
		'camdcimgtc',
		'oivokprjsm',
		'pbwasqroua',
		'rixilelhrs',
		'wolcqlirpc',
		'screeaumgr',
		'alxhpburyi',
		'jalaycalmp',
		'clojurermt',
	]
	words_to_search_for := [
		'clojure',
		'elixir',
		'ecmascript',
		'rust',
		'java',
		'lua',
		'lisp',
		'ruby',
	]
	expected := {
		'clojure':    ?WordLocation{
			start: Pair{
				column: 1
				row: 10
			}
			end: Pair{
				column: 7
				row: 10
			}
		}
		'elixir':     ?WordLocation{
			start: Pair{
				column: 6
				row: 5
			}
			end: Pair{
				column: 1
				row: 5
			}
		}
		'ecmascript': ?WordLocation{
			start: Pair{
				column: 10
				row: 1
			}
			end: Pair{
				column: 10
				row: 10
			}
		}
		'rust':       ?WordLocation{
			start: Pair{
				column: 9
				row: 5
			}
			end: Pair{
				column: 9
				row: 2
			}
		}
		'java':       ?WordLocation{
			start: Pair{
				column: 1
				row: 1
			}
			end: Pair{
				column: 4
				row: 4
			}
		}
		'lua':        ?WordLocation{
			start: Pair{
				column: 8
				row: 9
			}
			end: Pair{
				column: 6
				row: 7
			}
		}
		'lisp':       ?WordLocation{
			start: Pair{
				column: 3
				row: 6
			}
			end: Pair{
				column: 6
				row: 3
			}
		}
		'ruby':       ?WordLocation{
			start: Pair{
				column: 8
				row: 6
			}
			end: Pair{
				column: 5
				row: 9
			}
		}
	}
	assert search(grid, words_to_search_for) == expected
}

fn test_should_fail_to_locate_a_word_that_is_not_in_the_puzzle() {
	grid := [
		'jefblpepre',
		'camdcimgtc',
		'oivokprjsm',
		'pbwasqroua',
		'rixilelhrs',
		'wolcqlirpc',
		'screeaumgr',
		'alxhpburyi',
		'jalaycalmp',
		'clojurermt',
	]
	words_to_search_for := [
		'clojure',
		'elixir',
		'ecmascript',
		'rust',
		'java',
		'lua',
		'lisp',
		'ruby',
		'haskell',
	]
	expected := {
		'clojure':    ?WordLocation{
			start: Pair{
				column: 1
				row: 10
			}
			end: Pair{
				column: 7
				row: 10
			}
		}
		'elixir':     ?WordLocation{
			start: Pair{
				column: 6
				row: 5
			}
			end: Pair{
				column: 1
				row: 5
			}
		}
		'ecmascript': ?WordLocation{
			start: Pair{
				column: 10
				row: 1
			}
			end: Pair{
				column: 10
				row: 10
			}
		}
		'rust':       ?WordLocation{
			start: Pair{
				column: 9
				row: 5
			}
			end: Pair{
				column: 9
				row: 2
			}
		}
		'java':       ?WordLocation{
			start: Pair{
				column: 1
				row: 1
			}
			end: Pair{
				column: 4
				row: 4
			}
		}
		'lua':        ?WordLocation{
			start: Pair{
				column: 8
				row: 9
			}
			end: Pair{
				column: 6
				row: 7
			}
		}
		'lisp':       ?WordLocation{
			start: Pair{
				column: 3
				row: 6
			}
			end: Pair{
				column: 6
				row: 3
			}
		}
		'ruby':       ?WordLocation{
			start: Pair{
				column: 8
				row: 6
			}
			end: Pair{
				column: 5
				row: 9
			}
		}
		'haskell':    ?WordLocation(none)
	}
	assert search(grid, words_to_search_for) == expected
}

fn test_should_fail_to_locate_words_that_are_not_on_horizontal_vertical_or_diagonal_lines() {
	grid := [
		'abc',
		'def',
	]
	words_to_search_for := [
		'aef',
		'ced',
		'abf',
		'cbd',
	]
	expected := {
		'aef': ?WordLocation(none)
		'ced': ?WordLocation(none)
		'abf': ?WordLocation(none)
		'cbd': ?WordLocation(none)
	}
	assert search(grid, words_to_search_for) == expected
}

fn test_should_not_concatenate_different_lines_to_find_a_horizontal_word() {
	grid := [
		'abceli',
		'xirdfg',
	]
	words_to_search_for := [
		'elixir',
	]
	expected := {
		'elixir': ?WordLocation(none)
	}
	assert search(grid, words_to_search_for) == expected
}

fn test_should_not_wrap_around_horizontally_to_find_a_word() {
	grid := [
		'silabcdefp',
	]
	words_to_search_for := [
		'lisp',
	]
	expected := {
		'lisp': ?WordLocation(none)
	}
	assert search(grid, words_to_search_for) == expected
}

fn test_should_not_wrap_around_vertically_to_find_a_word() {
	grid := [
		's',
		'u',
		'r',
		'a',
		'b',
		'c',
		't',
	]
	words_to_search_for := [
		'rust',
	]
	expected := {
		'rust': ?WordLocation(none)
	}
	assert search(grid, words_to_search_for) == expected
}
