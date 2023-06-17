module main

fn test_encode_with_two_rails() {
	message := 'XOXOXOXOXOXOXOXOXO'
	encoded := 'XXXXXXXXXOOOOOOOOO'
	assert encode(message, 2) == encoded
}

fn test_encode_with_three_rails() {
	message := 'WEAREDISCOVEREDFLEEATONCE'
	encoded := 'WECRLTEERDSOEEFEAOCAIVDEN'
	assert encode(message, 3) == encoded
}

fn test_encode_with_ending_in_the_middle() {
	message := 'EXERCISES'
	encoded := 'ESXIEECSR'
	assert encode(message, 4) == encoded
}

fn test_decode_with_three_rails() {
	message := 'TEITELHDVLSNHDTISEIIEA'
	decoded := 'THEDEVILISINTHEDETAILS'
	assert decode(message, 3) == decoded
}

fn test_decode_with_five_rails() {
	message := 'EIEXMSMESAORIWSCE'
	decoded := 'EXERCISMISAWESOME'
	assert decode(message, 5) == decoded
}

fn test_decode_with_six_rails() {
	message := '133714114238148966225439541018335470986172518171757571896261'
	decoded := '112358132134558914423337761098715972584418167651094617711286'
	assert decode(message, 6) == decoded
}
