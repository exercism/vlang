module main

fn test_encode_yes() {
	phrase := 'yes'
	expect := 'xbt'
	assert encode(phrase, Key{ a: 5, b: 7 })! == expect
}

fn test_encode_no() {
	phrase := 'no'
	expect := 'fu'
	assert encode(phrase, Key{ a: 15, b: 18 })! == expect
}

fn test_encode_omg() {
	phrase := 'OMG'
	expect := 'lvz'
	assert encode(phrase, Key{ a: 21, b: 3 })! == expect
}

fn test_encode_o_m_g() {
	phrase := 'O M G'
	expect := 'hjp'
	assert encode(phrase, Key{ a: 25, b: 47 })! == expect
}

fn test_encode_mindblowingly() {
	phrase := 'mindblowingly'
	expect := 'rzcwa gnxzc dgt'
	assert encode(phrase, Key{ a: 11, b: 15 })! == expect
}

fn test_encode_numbers() {
	phrase := 'Testing,1 2 3, testing.'
	expect := 'jqgjc rw123 jqgjc rw'
	assert encode(phrase, Key{ a: 3, b: 4 })! == expect
}

fn test_encode_deep_thought() {
	phrase := 'Truth is fiction.'
	expect := 'iynia fdqfb ifje'
	assert encode(phrase, Key{ a: 5, b: 17 })! == expect
}

fn test_encode_all_the_letters() {
	phrase := 'The quick brown fox jumps over the lazy dog.'
	expect := 'swxtj npvyk lruol iejdc blaxk swxmh qzglf'
	assert encode(phrase, Key{ a: 17, b: 33 })! == expect
}

fn test_encode_with_a_not_coprime_to_m() {
	phrase := 'This is a test.'
	if res := encode(phrase, Key{ a: 6, b: 17 }) {
		assert false, 'encode with a not coprime to m should return an error'
	} else {
		assert typeof(err).name == 'IError'
	}
}

fn test_decode_exercism() {
	phrase := 'tytgn fjr'
	expect := 'exercism'
	assert decode(phrase, Key{ a: 3, b: 7 })! == expect
}

fn test_decode_a_sentence() {
	phrase := 'qdwju nqcro muwhn odqun oppmd aunwd o'
	expect := 'anobstacleisoftenasteppingstone'
	assert decode(phrase, Key{ a: 19, b: 16 })! == expect
}

fn test_decode_numbers() {
	phrase := 'odpoz ub123 odpoz ub'
	expect := 'testing123testing'
	assert decode(phrase, Key{ a: 25, b: 7 })! == expect
}

fn test_decode_all_the_letters() {
	phrase := 'swxtj npvyk lruol iejdc blaxk swxmh qzglf'
	expect := 'thequickbrownfoxjumpsoverthelazydog'
	assert decode(phrase, Key{ a: 17, b: 33 })! == expect
}

fn test_decode_with_no_spaces_in_input() {
	phrase := 'swxtjnpvyklruoliejdcblaxkswxmhqzglf'
	expect := 'thequickbrownfoxjumpsoverthelazydog'
	assert decode(phrase, Key{ a: 17, b: 33 })! == expect
}

fn test_decode_with_too_many_spaces() {
	phrase := 'vszzm    cly   yd cg    qdp'
	expect := 'jollygreengiant'
	assert decode(phrase, Key{ a: 15, b: 16 })! == expect
}

fn test_decode_with_a_not_coprime_to_m() {
	phrase := 'Test'
	if res := decode(phrase, Key{ a: 13, b: 5 }) {
		assert false, 'decode with a not coprime to m should return an error'
	} else {
		assert typeof(err).name == 'IError'
	}
}
