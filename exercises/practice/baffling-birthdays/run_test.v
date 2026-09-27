module main

import math
import time

// birthdates_per_test is how many generated birthdates the tests that inspect
// them look at. It is large enough for all 12 months, all 31 possible days and
// plenty of years to show up in it.
const birthdates_per_test = 2000

// estimated_runs is the number of estimates that every probability test
// averages. A single estimate comes out of a simulation and is therefore
// random, but the average of many of them sits reliably next to the exact
// probability from the canonical data.
const estimated_runs = 25

// probability_tolerance is the number of percentage points an averaged
// estimate may differ from the canonical data. An estimate is a simulation, so
// a small deviation is expected, the canonical data asks for a tolerance.
const probability_tolerance = 1.5

// A birthdate is formatted as 'YYYY-MM-DD'.
fn year_of(birthdate string) int {
	return birthdate[0..4].int()
}

fn month_of(birthdate string) int {
	return birthdate[5..7].int()
}

fn day_of(birthdate string) int {
	return birthdate[8..10].int()
}

// average_probability_of_shared_birthday averages estimated_runs estimates, so
// that the tests can compare a probability against the canonical data.
fn average_probability_of_shared_birthday(group_size int) f64 {
	mut total := 0.0
	for _ in 0 .. estimated_runs {
		total += estimated_probability_of_shared_birthday(group_size)
	}
	return total / f64(estimated_runs)
}

fn test_one_birthdate() {
	assert !shared_birthday(['2000-01-01'])
}

fn test_two_birthdates_with_same_year_month_and_day() {
	assert shared_birthday(['2000-01-01', '2000-01-01'])
}

fn test_two_birthdates_with_same_year_and_month_but_different_day() {
	assert !shared_birthday(['2012-05-09', '2012-05-17'])
}

fn test_two_birthdates_with_same_month_and_day_but_different_year() {
	assert shared_birthday(['1999-10-23', '1988-10-23'])
}

fn test_two_birthdates_with_same_year_but_different_month_and_day() {
	assert !shared_birthday(['2007-12-19', '2007-04-27'])
}

fn test_two_birthdates_with_different_year_month_and_day() {
	assert !shared_birthday(['1997-08-04', '1963-11-23'])
}

fn test_multiple_birthdates_without_shared_birthday() {
	dates := ['1966-07-29', '1977-02-12', '2001-12-25', '1980-11-10']
	assert !shared_birthday(dates)
}

fn test_multiple_birthdates_with_one_shared_birthday() {
	dates := ['1966-07-29', '1977-02-12', '2001-07-29', '1980-11-10']
	assert shared_birthday(dates)
}

fn test_multiple_birthdates_with_more_than_one_shared_birthday() {
	dates := ['1966-07-29', '1977-02-12', '2001-12-25', '1980-07-29', '2019-02-12']
	assert shared_birthday(dates)
}

fn test_generate_requested_number_of_birthdates() {
	for group_size in [1, 2, 10, 23, 70] {
		birthdates := random_birthdates(group_size)
		assert birthdates.len == group_size, 'asked for ${group_size} birthdates, got ${birthdates.len}'
	}
}

fn test_years_are_not_leap_years() {
	for birthdate in random_birthdates(birthdates_per_test) {
		year := year_of(birthdate)
		assert !time.is_leap_year(year), '${birthdate} lies in a leap year'
	}
}

fn test_months_are_random() {
	mut months := map[int]bool{}
	for birthdate in random_birthdates(birthdates_per_test) {
		months[month_of(birthdate)] = true
	}
	assert months.len == 12, 'expected all 12 months, saw ${months.len} of them'
}

fn test_days_are_random() {
	mut days := map[int]bool{}
	for birthdate in random_birthdates(birthdates_per_test) {
		// A year has 365 days, so a birthday never falls on 29 February and
		// never past the end of its month.
		month_length := time.days_in_month(month_of(birthdate), year_of(birthdate)) or { 0 }
		day := day_of(birthdate)
		assert day >= 1 && day <= month_length, '${birthdate} is not a date'
		days[day] = true
	}
	assert days.len == 31, 'expected all 31 possible days, saw ${days.len} of them'
}

fn test_estimated_probability_for_one_person() {
	// One person can never share a birthday, so this is not a random result.
	assert average_probability_of_shared_birthday(1) == 0.0
}

fn test_estimated_probability_among_ten_people() {
	probability := average_probability_of_shared_birthday(10)
	assert math.abs(probability - 11.694818) < probability_tolerance, 'expected about 11.694818, got ${probability}'
}

fn test_estimated_probability_among_twenty_three_people() {
	probability := average_probability_of_shared_birthday(23)
	assert math.abs(probability - 50.729723) < probability_tolerance, 'expected about 50.729723, got ${probability}'
}

fn test_estimated_probability_among_seventy_people() {
	probability := average_probability_of_shared_birthday(70)
	assert math.abs(probability - 99.915958) < probability_tolerance, 'expected about 99.915958, got ${probability}'
}
