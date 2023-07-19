module main

/*
The summation ('sum') of a sequence is explained in

   https://en.wikipedia.org/wiki/0_%2B_2_%2B_3_%2B_4_%2B_%E2%8B%AF
*/
pub fn square_of_sum(n u32) u32 {
	sum := (n * (n + 1)) / 2
	return sum * sum
}

/*
For an explanation see:

   https://en.wikipedia.org/wiki/Square_pyramidal_number#Geometric_enumeration
*/
pub fn sum_of_squares(n u32) u32 {
	return n * (n + 1) * (2 * n + 1) / 6
}

pub fn difference(n u32) u32 {
	return square_of_sum(n) - sum_of_squares(n)
}
