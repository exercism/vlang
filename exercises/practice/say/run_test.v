module main

fn test_zero() {
	if res := say(0) {
		assert res == 'zero'
	} else {
		assert false, 'say(0) should not return an error'
	}
}

fn test_one() {
	if res := say(1) {
		assert res == 'one'
	} else {
		assert false, 'say(1) should not return an error'
	}
}

fn test_fourteen() {
	if res := say(14) {
		assert res == 'fourteen'
	} else {
		assert false, 'say(14) should not return an error'
	}
}

fn test_twenty() {
	if res := say(20) {
		assert res == 'twenty'
	} else {
		assert false, 'say(20) should not return an error'
	}
}

fn test_twenty_two() {
	if res := say(22) {
		assert res == 'twenty-two'
	} else {
		assert false, 'say(22) should not return an error'
	}
}

fn test_thirty() {
	if res := say(30) {
		assert res == 'thirty'
	} else {
		assert false, 'say(30) should not return an error'
	}
}

fn test_ninety_nine() {
	if res := say(99) {
		assert res == 'ninety-nine'
	} else {
		assert false, 'say(99) should not return an error'
	}
}

fn test_one_hundred() {
	if res := say(100) {
		assert res == 'one hundred'
	} else {
		assert false, 'say(100) should not return an error'
	}
}

fn test_one_hundred_twenty_three() {
	if res := say(123) {
		assert res == 'one hundred twenty-three'
	} else {
		assert false, 'say(123) should not return an error'
	}
}

fn test_two_hundred() {
	if res := say(200) {
		assert res == 'two hundred'
	} else {
		assert false, 'say(200) should not return an error'
	}
}

fn test_nine_hundred_ninety_nine() {
	if res := say(999) {
		assert res == 'nine hundred ninety-nine'
	} else {
		assert false, 'say(999) should not return an error'
	}
}

fn test_one_thousand() {
	if res := say(1000) {
		assert res == 'one thousand'
	} else {
		assert false, 'say(1000) should not return an error'
	}
}

fn test_one_thousand_two_hundred_thirty_four() {
	if res := say(1234) {
		assert res == 'one thousand two hundred thirty-four'
	} else {
		assert false, 'say(1234) should not return an error'
	}
}

fn test_one_million() {
	if res := say(1000000) {
		assert res == 'one million'
	} else {
		assert false, 'say(1000000) should not return an error'
	}
}

fn test_one_million_two_thousand_three_hundred_forty_five() {
	if res := say(1002345) {
		assert res == 'one million two thousand three hundred forty-five'
	} else {
		assert false, 'say(1002345) should not return an error'
	}
}

fn test_one_billion() {
	if res := say(1000000000) {
		assert res == 'one billion'
	} else {
		assert false, 'say(1000000000) should not return an error'
	}
}

fn test_a_big_number() {
	if res := say(987654321123) {
		assert res == 'nine hundred eighty-seven billion six hundred fifty-four million three hundred twenty-one thousand one hundred twenty-three'
	} else {
		assert false, 'say(987654321123) should not return an error'
	}
}

fn test_numbers_below_zero_are_out_of_range() {
	if res := say(-1) {
		assert false, 'numbers below zero should return an error'
	} else {
		assert err.msg() == 'input out of range'
	}
}

fn test_numbers_above_999999999999_are_out_of_range() {
	if res := say(1000000000000) {
		assert false, 'numbers above 999,999,999,999 should return an error'
	} else {
		assert err.msg() == 'input out of range'
	}
}
