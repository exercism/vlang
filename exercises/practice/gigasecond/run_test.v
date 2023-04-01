module main

import time

fn test_date_specified_of_time() {
	assert add_gigasecond(time.parse_rfc3339('2011-04-25')!) == time.parse_rfc3339('2043-01-01T01:46:40')!
}

fn test_second_date_specified_of_time() {
	assert add_gigasecond(time.parse_rfc3339('1977-06-13')!) == time.parse_rfc3339('2009-02-19T01:46:40')!
}

fn test_third_date_specified_of_time() {
	assert add_gigasecond(time.parse_rfc3339('1959-07-19')!) == time.parse_rfc3339('1991-03-27T01:46:40')!
}

fn test_full_time_specified() {
	assert add_gigasecond(time.parse_rfc3339('2015-01-24T22:00:00')!) == time.parse_rfc3339('2046-10-02T23:46:40')!
}

fn test_full_time_with_day_roll_over() {
	assert add_gigasecond(time.parse_rfc3339('2015-01-24T23:59:59')!) == time.parse_rfc3339('2046-10-03T01:46:39')!
}

fn test_immutable() {
	moment := time.parse_rfc3339('2015-01-24T23:59:59')!
	res := add_gigasecond(moment)
	assert moment == time.parse_rfc3339('2015-01-24T23:59:59')!
}
