module main

fn collatz(number int) !int {
	mut n := number
	mut times := 0
	
	if n <= 0 {
		return error("zero or negative value given")
	}

	for n != 1 {
		if n%2 == 0 {
			n = n / 2
		} else {
			n = n*3 + 1
		}
		times += 1
	}

	return times
}
