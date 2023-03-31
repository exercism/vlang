module main

import time

fn test_date_specified_of_time() {
	assert add_gigasecond(time.parse('2011-04-25 00:00:00')!) == time.parse('2043-01-01 01:46:40')!
}

fn test_second_date_specified_of_time() {
	assert add_gigasecond(time.parse('1977-06-13 00:00:00')!) == time.parse('2009-02-19 01:46:40')!
}

fn test_third_date_specified_of_time() {
	assert add_gigasecond(time.parse('1959-07-19 00:00:00')!) == time.parse('1991-03-27 01:46:40')!
}

fn test_full_time_specified() {
	assert add_gigasecond(time.parse_rfc3339('2015-01-24T22:00:00')!) == time.parse('2046-10-02 23:46:40')!
}

fn test_full_time_with_day_roll_over() {
	assert add_gigasecond(time.parse_rfc3339('2015-01-24T23:59:59')!) == time.parse('2046-10-03 01:46:39')!
}

fn test_immutable() {
	moment := time.parse_rfc3339('2015-01-24T23:59:59')!
	res := add_gigasecond(moment)
	assert moment == time.parse_rfc3339('2015-01-24T23:59:59')!
}
