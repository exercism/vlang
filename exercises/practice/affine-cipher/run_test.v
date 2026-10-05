module main

fn test_encode_yes() {
	phrase := 'yes'
	expect := 'xbt'
	if res := encode(phrase, Key{ a: 5, b: 7 }) {
		assert res == expect
	} else {
		assert false, 'encode(phrase, Key{ a: 5, b: 7 }) should not return an error'
	}
}

fn test_encode_no() {
	phrase := 'no'
	expect := 'fu'
	if res := encode(phrase, Key{ a: 15, b: 18 }) {
		assert res == expect
	} else {
		assert false, 'encode(phrase, Key{ a: 15, b: 18 }) should not return an error'
	}
}

fn test_encode_omg() {
	phrase := 'OMG'
	expect := 'lvz'
	if res := encode(phrase, Key{ a: 21, b: 3 }) {
		assert res == expect
	} else {
		assert false, 'encode(phrase, Key{ a: 21, b: 3 }) should not return an error'
	}
}

fn test_encode_o_m_g() {
	phrase := 'O M G'
	expect := 'hjp'
	if res := encode(phrase, Key{ a: 25, b: 47 }) {
		assert res == expect
	} else {
		assert false, 'encode(phrase, Key{ a: 25, b: 47 }) should not return an error'
	}
}

fn test_encode_mindblowingly() {
	phrase := 'mindblowingly'
	expect := 'rzcwa gnxzc dgt'
	if res := encode(phrase, Key{ a: 11, b: 15 }) {
		assert res == expect
	} else {
		assert false, 'encode(phrase, Key{ a: 11, b: 15 }) should not return an error'
	}
}

fn test_encode_numbers() {
	phrase := 'Testing,1 2 3, testing.'
	expect := 'jqgjc rw123 jqgjc rw'
	if res := encode(phrase, Key{ a: 3, b: 4 }) {
		assert res == expect
	} else {
		assert false, 'encode(phrase, Key{ a: 3, b: 4 }) should not return an error'
	}
}

fn test_encode_deep_thought() {
	phrase := 'Truth is fiction.'
	expect := 'iynia fdqfb ifje'
	if res := encode(phrase, Key{ a: 5, b: 17 }) {
		assert res == expect
	} else {
		assert false, 'encode(phrase, Key{ a: 5, b: 17 }) should not return an error'
	}
}

fn test_encode_all_the_letters() {
	phrase := 'The quick brown fox jumps over the lazy dog.'
	expect := 'swxtj npvyk lruol iejdc blaxk swxmh qzglf'
	if res := encode(phrase, Key{ a: 17, b: 33 }) {
		assert res == expect
	} else {
		assert false, 'encode(phrase, Key{ a: 17, b: 33 }) should not return an error'
	}
}

fn test_encode_with_a_not_coprime_to_m() {
	phrase := 'This is a test.'
	if res := encode(phrase, Key{ a: 6, b: 17 }) {
		assert false, 'encode with a not coprime to m should return an error'
	} else {
		assert err.msg() == 'a and m must be coprime.'
	}
}

fn test_decode_exercism() {
	phrase := 'tytgn fjr'
	expect := 'exercism'
	if res := decode(phrase, Key{ a: 3, b: 7 }) {
		assert res == expect
	} else {
		assert false, 'decode(phrase, Key{ a: 3, b: 7 }) should not return an error'
	}
}

fn test_decode_a_sentence() {
	phrase := 'qdwju nqcro muwhn odqun oppmd aunwd o'
	expect := 'anobstacleisoftenasteppingstone'
	if res := decode(phrase, Key{ a: 19, b: 16 }) {
		assert res == expect
	} else {
		assert false, 'decode(phrase, Key{ a: 19, b: 16 }) should not return an error'
	}
}

fn test_decode_numbers() {
	phrase := 'odpoz ub123 odpoz ub'
	expect := 'testing123testing'
	if res := decode(phrase, Key{ a: 25, b: 7 }) {
		assert res == expect
	} else {
		assert false, 'decode(phrase, Key{ a: 25, b: 7 }) should not return an error'
	}
}

fn test_decode_all_the_letters() {
	phrase := 'swxtj npvyk lruol iejdc blaxk swxmh qzglf'
	expect := 'thequickbrownfoxjumpsoverthelazydog'
	if res := decode(phrase, Key{ a: 17, b: 33 }) {
		assert res == expect
	} else {
		assert false, 'decode(phrase, Key{ a: 17, b: 33 }) should not return an error'
	}
}

fn test_decode_with_no_spaces_in_input() {
	phrase := 'swxtjnpvyklruoliejdcblaxkswxmhqzglf'
	expect := 'thequickbrownfoxjumpsoverthelazydog'
	if res := decode(phrase, Key{ a: 17, b: 33 }) {
		assert res == expect
	} else {
		assert false, 'decode(phrase, Key{ a: 17, b: 33 }) should not return an error'
	}
}

fn test_decode_with_too_many_spaces() {
	phrase := 'vszzm    cly   yd cg    qdp'
	expect := 'jollygreengiant'
	if res := decode(phrase, Key{ a: 15, b: 16 }) {
		assert res == expect
	} else {
		assert false, 'decode(phrase, Key{ a: 15, b: 16 }) should not return an error'
	}
}

fn test_decode_with_a_not_coprime_to_m() {
	phrase := 'Test'
	if res := decode(phrase, Key{ a: 13, b: 5 }) {
		assert false, 'decode with a not coprime to m should return an error'
	} else {
		assert err.msg() == 'a and m must be coprime.'
	}
}
