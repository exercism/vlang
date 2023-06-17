module main

import strings

const units_names = [
	'zero ',
	'one ',
	'two ',
	'three ',
	'four ',
	'five ',
	'six ',
	'seven ',
	'eight ',
	'nine ',
	'ten ',
	'eleven ',
	'twelve ',
	'thirteen ',
	'fourteen ',
	'fifteen ',
	'sixteen ',
	'seventeen ',
	'eighteen ',
	'nineteen ',
]

const tens_names = [
	'zero ',
	'ten ',
	'twenty ',
	'thirty ',
	'forty ',
	'fifty ',
	'sixty ',
	'seventy ',
	'eighty ',
	'ninety ',
]

// Express num in words, appending to builder.
fn say2(num int, mut builder strings.Builder) {
	assert 0 <= num && num < 100
	if num == 0 {
		return
	}

	if num < 20 {
		builder.write_string(units_names[num])
	} else {
		builder.write_string(tens_names[num / 10])
		if num % 10 != 0 {
			builder.go_back(1)
			builder.write_rune(`-`)
			builder.write_string(units_names[num % 10])
		}
	}
}

// Express num units in words, appending to builder.
fn say3(num int, units ?string, mut builder strings.Builder) {
	assert 0 <= num && num < 1000
	if num == 0 {
		return
	}

	if num >= 100 {
		say2(num / 100, mut builder)
		builder.write_string('hundred ')
	}
	say2(num % 100, mut builder)

	if suffix := units {
		builder.write_string(suffix)
	}
}

fn say(number i64) !string {
	if number < 0 || number >= 1_000_000_000_000 {
		return error('input out of range')
	}
	if number == 0 {
		return 'zero'
	}

	mut builder := strings.new_builder(160)
	say3(int(number / 1_000_000_000), 'billion ', mut builder)
	say3(int(number / 1_000_000 % 1000), 'million ', mut builder)
	say3(int(number / 1_000 % 1000), 'thousand ', mut builder)
	say3(int(number % 1000), none, mut builder)
	builder.go_back(1)
	return builder.str()
}
