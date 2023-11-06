module main

fn test_run_length_encode_a_string__empty_string() {
	message := ''
	encoded := ''
	assert encode(message) == encoded
}

fn test_run_length_encode_a_string__single_characters_only_are_encoded_without_count() {
	message := 'XYZ'
	encoded := 'XYZ'
	assert encode(message) == encoded
}

fn test_run_length_encode_a_string__string_with_no_single_characters() {
	message := 'AABBBCCCC'
	encoded := '2A3B4C'
	assert encode(message) == encoded
}

fn test_run_length_encode_a_string__single_characters_mixed_with_repeated_characters() {
	message := 'WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB'
	encoded := '12WB12W3B24WB'
	assert encode(message) == encoded
}

fn test_run_length_encode_a_string__multiple_whitespace_mixed_in_string() {
	message := '  hsqq qww  '
	encoded := '2 hs2q q2w2 '
	assert encode(message) == encoded
}

fn test_run_length_encode_a_string__lowercase_characters() {
	message := 'aabbbcccc'
	encoded := '2a3b4c'
	assert encode(message) == encoded
}

fn test_run_length_decode_a_string__empty_string() {
	message := ''
	decoded := ''
	assert decode(message) == decoded
}

fn test_run_length_decode_a_string__single_characters_only() {
	message := 'XYZ'
	decoded := 'XYZ'
	assert decode(message) == decoded
}

fn test_run_length_decode_a_string__string_with_no_single_characters() {
	message := '2A3B4C'
	decoded := 'AABBBCCCC'
	assert decode(message) == decoded
}

fn test_run_length_decode_a_string__single_characters_with_repeated_characters() {
	message := '12WB12W3B24WB'
	decoded := 'WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB'
	assert decode(message) == decoded
}

fn test_run_length_decode_a_string__multiple_whitespace_mixed_in_string() {
	message := '2 hs2q q2w2 '
	decoded := '  hsqq qww  '
	assert decode(message) == decoded
}

fn test_run_length_decode_a_string__lowercase_string() {
	message := '2a3b4c'
	decoded := 'aabbbcccc'
	assert decode(message) == decoded
}

fn test_encode_and_then_decode__encode_followed_by_decode_gives_original_string() {
	message := 'zzz ZZ  zZ'
	assert decode(encode(message)) == message
}
