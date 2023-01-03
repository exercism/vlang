module main

import time

fn date(phrase string) string {
	splits := phrase.split(' ')
	if splits.len == 6 {
		return parse_real_words(splits)
	} else {
		return parse_fake_words(splits)
	}
}

fn parse_real_words(phrase []string) string {
	num_string := phrase[1]
	day_string := phrase[2]
	month_string := phrase[4]
	year := phrase[5].int()

	num := match num_string {
		'first' { 1 }
		'second' { 2 }
		'third' { 3 }
		'fourth' { 4 }
		'fifth' { 5 }
		'last' { -1 }
		else { panic('invalid ${num_string}') }
	}

	day := match day_string {
		'Monday' { 1 }
		'Tuesday' { 2 }
		'Wednesday' { 3 }
		'Thursday' { 4 }
		'Friday' { 5 }
		'Saturday' { 6 }
		'Sunday' { 7 }
		else { panic('invalid ${day_string}') }
	}

	month := match month_string {
		'January' { 1 }
		'February' { 2 }
		'March' { 3 }
		'April' { 4 }
		'May' { 5 }
		'June' { 6 }
		'July' { 7 }
		'August' { 8 }
		'September' { 9 }
		'October' { 10 }
		'November' { 11 }
		'December' { 12 }
		else { panic('invalid ${month_string}') }
	}

	if num > 0 {
		return nth_day_in_month_and_year(num, day, month, year)
	} else {
		return last_day_in_month_and_year(day, month, year)
	}
}

fn nth_day_in_month_and_year(num int, day int, month int, year int) string {
	first_weekday_of_month := time.day_of_week(year, month, 1)
	day_diff := day - first_weekday_of_month
	if day_diff < 0 {
		return '${year}/${month}/${day_diff + 1 + num * 7}'
	} else {
		return '${year}/${month}/${day_diff + 1 + (num - 1) * 7}'
	}
}

fn last_day_in_month_and_year(day int, month int, year int) string {
	last_day_of_month := time.days_in_month(month, year) or { panic('invalid ${month}') }
	last_weekday_of_month := time.day_of_week(year, month, last_day_of_month)
	day_diff := day - last_weekday_of_month
	if day_diff > 0 {
		return '${year}/${month}/${last_day_of_month + day_diff - 7}'
	}
	return '${year}/${month}/${last_day_of_month + day_diff}'
}

fn parse_fake_words(phrase []string) string {
	fake_string := phrase[1]
	month_string := phrase[3]
	year := phrase[4].int()

	month := match month_string {
		'January' { 1 }
		'February' { 2 }
		'March' { 3 }
		'April' { 4 }
		'May' { 5 }
		'June' { 6 }
		'July' { 7 }
		'August' { 8 }
		'September' { 9 }
		'October' { 10 }
		'November' { 11 }
		'December' { 12 }
		else { panic('invalid ${month_string}') }
	}

	teenth_day := match fake_string {
		'monteenth' { 1 }
		'tuesteenth' { 2 }
		'wednesteenth' { 3 }
		'thursteenth' { 4 }
		'friteenth' { 5 }
		'saturteenth' { 6 }
		'sunteenth' { 7 }
		else { panic('invalid ${fake_string}') }
	}

	day_of_thirteenth := time.day_of_week(year, month, 13)
	day_diff := teenth_day - day_of_thirteenth
	if day_diff < 0 {
		return '${year}/${month}/${13 + (7 + day_diff)}'
	} else {
		return '${year}/${month}/${13 + day_diff}'
	}
}
