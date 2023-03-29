module main

import time

fn test_date_specified_of_time() {
	assert '2043-01-01T01:46:40' == add_gigasecond(time.parse('2011-04-25 00:00:00')!).format_rfc3339().all_before('.')
}

fn test_second_date_specified_of_time() {
	assert '2009-02-19T01:46:40' == add_gigasecond(time.parse('1977-06-13 00:00:00')!).format_rfc3339().all_before('.')
}

fn test_third_date_specified_of_time() {
	assert '1991-03-27T01:46:40' == add_gigasecond(time.parse('1959-07-19 00:00:00')!).format_rfc3339().all_before('.')
}

fn test_full_time_specified() {
	assert '2046-10-02T23:46:40' == add_gigasecond(time.parse_rfc3339('2015-01-24T22:00:00')!).format_rfc3339().all_before('.')
}

fn test_full_time_with_day_roll_over() {
	assert '2046-10-03T01:46:39' == add_gigasecond(time.parse_rfc3339('2015-01-24T23:59:59')!).format_rfc3339().all_before('.')
}
