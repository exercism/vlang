module main

const ones = [u8(`I`), `X`, `C`, `M`]

const fives = [u8(`V`), `L`, `D`]

fn write(mut buffer []u8, digit int, place int) {
	if digit % 5 == 4 {
		buffer << ones[place]
		write(mut buffer, digit + 1, place)
	} else if digit == 10 {
		write(mut buffer, 1, place + 1)
	} else if digit >= 5 {
		buffer << fives[place]
		write(mut buffer, digit - 5, place)
	} else if digit > 0 {
		buffer << ones[place]
		write(mut buffer, digit - 1, place)
	}
}

fn roman(number int) string {
	assert number < 4000
	mut buffer := []u8{}
	write(mut buffer, number / 1000, 3)
	write(mut buffer, number / 100 % 10, 2)
	write(mut buffer, number / 10 % 10, 1)
	write(mut buffer, number % 10, 0)
	return buffer.bytestr()
}
