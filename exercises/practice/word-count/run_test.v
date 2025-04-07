module main

fn test_count_one_word() {
	expected := {
		'word': 1
	}
	assert count_words('word') == expected
}

fn test_count_one_of_each_word() {
	expected := {
		'one':  1
		'of':   1
		'each': 1
	}
	assert count_words('one of each') == expected
}

fn test_multiple_occurrences_of_a_word() {
	expected := {
		'one':  1
		'fish': 4
		'two':  1
		'red':  1
		'blue': 1
	}
	assert count_words('one fish two fish red fish blue fish') == expected
}

fn test_handles_cramped_lists() {
	expected := {
		'one':   1
		'two':   1
		'three': 1
	}
	assert count_words('one,two,three') == expected
}

fn test_handles_expanded_lists() {
	expected := {
		'one':   1
		'two':   1
		'three': 1
	}
	assert count_words('one,\ntwo,\nthree') == expected
}

fn test_ignore_punctuation() {
	expected := {
		'car':        1
		'carpet':     1
		'as':         1
		'java':       1
		'javascript': 1
	}
	assert count_words('car: carpet as java: javascript!!&@$%^&') == expected
}

fn test_include_numbers() {
	expected := {
		'testing': 2
		'1':       1
		'2':       1
	}
	assert count_words('testing, 1, 2 testing') == expected
}

fn test_normalize_case() {
	expected := {
		'go':   3
		'stop': 2
	}
	assert count_words('go Go GO Stop stop') == expected
}

fn test_with_apostrophes() {
	expected := {
		'first':   1
		"don't":   2
		'laugh':   1
		'then':    1
		'cry':     1
		"you're":  1
		'getting': 1
		'it':      1
	}
	assert count_words("'First: don't laugh. Then: don't cry. You're getting it.'") == expected
}

fn test_with_quotations() {
	expected := {
		'joe':     1
		"can't":   1
		'tell':    1
		'between': 1
		'large':   2
		'and':     1
	}
	assert count_words("Joe can't tell between 'large' and large.") == expected
}

fn test_substrings_from_the_beginning() {
	expected := {
		'joe':     1
		"can't":   1
		'tell':    1
		'between': 1
		'app':     1
		'apple':   1
		'and':     1
		'a':       1
	}
	assert count_words("Joe can't tell between app, apple and a.") == expected
}

fn test_multiple_spaces_not_detected_as_a_word() {
	expected := {
		'multiple':    1
		'whitespaces': 1
	}
	assert count_words(' multiple   whitespaces') == expected
}

fn test_alternating_word_separators_not_detected_as_a_word() {
	expected := {
		'one':   1
		'two':   1
		'three': 1
	}
	assert count_words(",\n,one,\n ,two \n 'three'") == expected
}

fn test_quotation_for_word_with_apostrophe() {
	expected := {
		'can':   1
		"can't": 2
	}
	assert count_words("can, can't, 'can't'") == expected
}
