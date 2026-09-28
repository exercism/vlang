module main

// Two assumptions from the instructions apply to everything below:
//
//   - a year has 365 days, so 29 February is never a birthday
//   - every one of those 365 birthdays is equally likely
//
// A *birthdate* is a string formatted as 'YYYY-MM-DD', a *birthday* is the
// 'MM-DD' part of it, the part that comes around again every year.
//
// The `rand` module of the standard library is the natural tool for the random
// parts of this exercise.

// `birthdates` holds the full birthdate of every person in a group.
//
// Report whether at least two of the people were born on the same birthday,
// that is, whether two of the birthdates have the same month and day.
fn shared_birthday(birthdates []string) bool {
}

// Return one random birthdate per person in a group of `group_size` people.
//
// Every birthday is equally likely, so the 365 days of a year that is not a
// leap year are equally likely, and the year of a birthdate is never a leap
// year. A `group_size` below 1 yields an empty list.
fn random_birthdates(group_size int) []string {
}

// Estimate how likely it is that at least two people in a group of
// `group_size` people share a birthday, and return that probability in
// percent, so a result of 11.694818 means 11.7%.
//
// The estimate is a simulation: generate many groups of `group_size` random
// birthdates with `random_birthdates` and count how often a shared birthday
// turns up with `shared_birthday`. The more groups are simulated, the closer
// the estimate gets to the exact probability.
fn estimated_probability_of_shared_birthday(group_size int) f64 {
}
