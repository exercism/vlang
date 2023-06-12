module main

fn test_encode_yes() {
	phrase := 'yes'
	expect := 'bvh'
	assert encode(phrase) == expect
}

fn test_encode_no() {
	phrase := 'no'
	expect := 'ml'
	assert encode(phrase) == expect
}

fn test_encode_omg() {
	phrase := 'OMG'
	expect := 'lnt'
	assert encode(phrase) == expect
}

fn test_encode_spaces() {
	phrase := 'O M G'
	expect := 'lnt'
	assert encode(phrase) == expect
}

fn test_encode_mindblowingly() {
	phrase := 'mindblowingly'
	expect := 'nrmwy oldrm tob'
	assert encode(phrase) == expect
}

fn test_encode_numbers() {
	phrase := 'Testing,1 2 3, testing.'
	expect := 'gvhgr mt123 gvhgr mt'
	assert encode(phrase) == expect
}

fn test_encode_deep_thought() {
	phrase := 'Truth is fiction.'
	expect := 'gifgs rhurx grlm'
	assert encode(phrase) == expect
}

fn test_encode_all_the_letters() {
	phrase := 'The quick brown fox jumps over the lazy dog.'
	expect := 'gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt'
	assert encode(phrase) == expect
}

fn test_decode_exercism() {
	phrase := 'vcvix rhn'
	expect := 'exercism'
	assert decode(phrase) == expect
}

fn test_decode_a_sentence() {
	phrase := 'zmlyh gzxov rhlug vmzhg vkkrm thglm v'
	expect := 'anobstacleisoftenasteppingstone'
	assert decode(phrase) == expect
}

fn test_decode_numbers() {
	phrase := 'gvhgr mt123 gvhgr mt'
	expect := 'testing123testing'
	assert decode(phrase) == expect
}

fn test_decode_all_the_letters() {
	phrase := 'gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt'
	expect := 'thequickbrownfoxjumpsoverthelazydog'
	assert decode(phrase) == expect
}

fn test_decode_with_too_many_spaces() {
	phrase := 'vc vix    r hn'
	expect := 'exercism'
	assert decode(phrase) == expect
}

fn test_decode_with_no_spaces() {
	phrase := 'zmlyhgzxovrhlugvmzhgvkkrmthglmv'
	expect := 'anobstacleisoftenasteppingstone'
	assert decode(phrase) == expect
}
