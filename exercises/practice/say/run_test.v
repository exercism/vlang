module main

fn test_zero() {
	assert say(0)! == 'zero'
}

fn test_one() {
	assert say(1)! == 'one'
}

fn test_fourteen() {
	assert say(14)! == 'fourteen'
}

fn test_twenty() {
	assert say(20)! == 'twenty'
}

fn test_twenty_two() {
	assert say(22)! == 'twenty-two'
}

fn test_thirty() {
	assert say(30)! == 'thirty'
}

fn test_ninety_nine() {
	assert say(99)! == 'ninety-nine'
}

fn test_one_hundred() {
	assert say(100)! == 'one hundred'
}

fn test_one_hundred_twenty_three() {
	assert say(123)! == 'one hundred twenty-three'
}

fn test_two_hundred() {
	assert say(200)! == 'two hundred'
}

fn test_nine_hundred_ninety_nine() {
	assert say(999)! == 'nine hundred ninety-nine'
}

fn test_one_thousand() {
	assert say(1000)! == 'one thousand'
}

fn test_one_thousand_two_hundred_thirty_four() {
	assert say(1234)! == 'one thousand two hundred thirty-four'
}

fn test_one_million() {
	assert say(1000000)! == 'one million'
}

fn test_one_million_two_thousand_three_hundred_forty_five() {
	assert say(1002345)! == 'one million two thousand three hundred forty-five'
}

fn test_one_billion() {
	assert say(1000000000)! == 'one billion'
}

fn test_a_big_number() {
	assert say(987654321123)! == 'nine hundred eighty-seven billion six hundred fifty-four million three hundred twenty-one thousand one hundred twenty-three'
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
