module main

import rand
import time

// The instructions say that a year has 365 days and that all of them are
// equally likely birthdays, so 29 February is never generated.
const days_per_year = 365

// A year that is not a leap year, used to turn a day of the year into a month
// and a day.
const reference_year = 2001

// The first and the last year a generated birthdate may come from. Neither of
// them is a leap year, which is what makes them safe to fall back on.
const first_birth_year = 1900
const last_birth_year = 2100

// simulated_groups is the number of groups of people simulated per estimate.
// The bigger it is, the closer the estimate gets to the exact probability.
const simulated_groups = 1000

fn shared_birthday(birthdates []string) bool {
	mut birthdays := map[string]bool{}
	for birthdate in birthdates {
		// A birthdate is formatted as 'YYYY-MM-DD', so the birthday, the part
		// that comes around again every year, starts at the fifth character.
		birthday := birthdate[5..]
		if birthdays[birthday] {
			return true
		}
		birthdays[birthday] = true
	}
	return false
}

fn random_birthdates(group_size int) []string {
	size := if group_size > 0 { group_size } else { 0 }
	mut birthdates := []string{cap: size}
	for _ in 0 .. size {
		birthdates << random_birthdate()
	}
	return birthdates
}

fn estimated_probability_of_shared_birthday(group_size int) f64 {
	mut groups_with_shared_birthday := 0
	for _ in 0 .. simulated_groups {
		if shared_birthday(random_birthdates(group_size)) {
			groups_with_shared_birthday++
		}
	}
	return 100.0 * f64(groups_with_shared_birthday) / f64(simulated_groups)
}

// random_birthdate returns one birthdate with a uniformly random birthday.
fn random_birthdate() string {
	day := rand.intn(days_per_year) or { 0 }
	month, day_of_month := month_and_day_of(day + 1)
	year := random_year()
	return '${year:04}-${month:02}-${day_of_month:02}'
}

// random_year returns a random year that is not a leap year.
fn random_year() int {
	mut year := random_year_candidate()
	for time.is_leap_year(year) {
		year = random_year_candidate()
	}
	return year
}

// random_year_candidate returns a random year from the range of birth years.
fn random_year_candidate() int {
	// rand only fails on a non-positive or inverted range, which this one is
	// not, and first_birth_year is a valid answer either way.
	return rand.int_in_range(first_birth_year, last_birth_year + 1) or { first_birth_year }
}

// month_and_day_of turns a day of a year that is not a leap year into the
// month and the day of that month it falls on.
fn month_and_day_of(day_of_year int) (int, int) {
	mut month := 1
	mut day := day_of_year
	for day > 0 {
		month_length := time.days_in_month(month, reference_year) or { return 0, 0 }
		if day <= month_length {
			return month, day
		}
		day -= month_length
		month++
	}
	return 0, 0
}
