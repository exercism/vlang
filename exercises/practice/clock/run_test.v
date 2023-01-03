module main

fn test_on_the_hour() {
	c := new_clock(8, 0)
	assert c.string() == '08:00'
}

fn test_past_the_hour() {
	c := new_clock(11, 9)
	assert c.string() == '11:09'
}

fn test_midnight_is_zero_hours() {
	c := new_clock(24, 0)
	assert c.string() == '00:00'
}

fn test_hours_roll_over() {
	c := new_clock(25, 0)
	assert c.string() == '01:00'
}

fn test_hours_roll_over_continuously() {
	c := new_clock(100, 0)
	assert c.string() == '04:00'
}

fn test_60_minutes_is_next_hour() {
	c := new_clock(1, 60)
	assert c.string() == '02:00'
}

fn test_minutes_roll_over() {
	c := new_clock(0, 160)
	assert c.string() == '02:40'
}

fn test_minutes_roll_over_continuously() {
	c := new_clock(0, 1723)
	assert c.string() == '04:43'
}

fn test_hour_and_minutes_roll_over() {
	c := new_clock(25, 160)
	assert c.string() == '03:40'
}

fn test_hour_and_minutes_roll_over_continuously() {
	c := new_clock(201, 3001)
	assert c.string() == '11:01'
}

fn test_hour_and_minutes_roll_over_to_midnight() {
	c := new_clock(72, 8640)
	assert c.string() == '00:00'
}

fn test_negative_hour() {
	c := new_clock(-1, 15)
	assert c.string() == '23:15'
}

fn test_negative_hour_rolls_over() {
	c := new_clock(-25, 0)
	assert c.string() == '23:00'
}

fn test_negative_hour_rolls_over_continuously() {
	c := new_clock(-91, 0)
	assert c.string() == '05:00'
}

fn test_negative_minutes() {
	c := new_clock(1, -40)
	assert c.string() == '00:20'
}

fn test_negative_minutes_roll_over() {
	c := new_clock(1, -160)
	assert c.string() == '22:20'
}

fn test_negative_minutes_roll_over_continuously() {
	c := new_clock(1, -4820)
	assert c.string() == '16:40'
}

fn test_negative_60_minutes_previous_hour() {
	c := new_clock(2, -60)
	assert c.string() == '01:00'
}

fn test_negative_hour_and_minute_roll_over() {
	c := new_clock(2, -60)
	assert c.string() == '01:00'
}

fn test_negative_hour_and_minute_roll_over_continuously() {
	c := new_clock(-121, -5810)
	assert c.string() == '22:10'
}

fn test_add_minutes() {
	mut c := new_clock(10, 0)
	c.add_time(3)
	assert c.string() == '10:03'
}

fn test_add_no_minutes() {
	mut c := new_clock(6, 41)
	c.add_time(0)
	assert c.string() == '06:41'
}

fn test_add_to_next_hour() {
	mut c := new_clock(0, 45)
	c.add_time(40)
	assert c.string() == '01:25'
}

fn test_add_more_than_one_hour() {
	mut c := new_clock(10, 0)
	c.add_time(61)
	assert c.string() == '11:01'
}

fn test_add_more_than_two_hours_with_carry() {
	mut c := new_clock(0, 45)
	c.add_time(160)
	assert c.string() == '03:25'
}

fn test_add_across_midnight() {
	mut c := new_clock(23, 59)
	c.add_time(2)
	assert c.string() == '00:01'
}

fn test_add_more_than_one_day() {
	mut c := new_clock(5, 32)
	c.add_time(1500)
	assert c.string() == '06:32'
}

fn test_add_more_than_two_days() {
	mut c := new_clock(1, 1)
	c.add_time(3500)
	assert c.string() == '11:21'
}

fn test_subtract_minutes() {
	mut c := new_clock(10, 3)
	c.subtract_time(3)
	assert c.string() == '10:00'
}

fn test_subtract_to_previous_hour() {
	mut c := new_clock(10, 3)
	c.subtract_time(30)
	assert c.string() == '09:33'
}

fn test_subtract_more_than_an_hour() {
	mut c := new_clock(10, 3)
	c.subtract_time(70)
	assert c.string() == '08:53'
}

fn test_subtract_across_midnight() {
	mut c := new_clock(0, 3)
	c.subtract_time(4)
	assert c.string() == '23:59'
}

fn test_subtract_more_than_2_hours() {
	mut c := new_clock(0, 0)
	c.subtract_time(160)
	assert c.string() == '21:20'
}

fn test_subtract_more_than_2_hours_with_borrow() {
	mut c := new_clock(6, 15)
	c.subtract_time(160)
	assert c.string() == '03:35'
}

fn test_subtract_more_than_one_day() {
	mut c := new_clock(5, 32)
	c.subtract_time(1500)
	assert c.string() == '04:32'
}

fn test_subtract_more_than_two_days() {
	mut c := new_clock(2, 20)
	c.subtract_time(3000)
	assert c.string() == '00:20'
}

fn test_two_clocks_same_time() {
	c1 := new_clock(15, 37)
	c2 := new_clock(15, 37)
	assert c1 == c2
}

fn test_clocks_a_minute_apart() {
	c1 := new_clock(15, 36)
	c2 := new_clock(15, 37)
	assert c1 != c2
}

fn test_clocks_an_hour_apart() {
	c1 := new_clock(14, 37)
	c2 := new_clock(15, 37)
	assert c1 != c2
}

fn test_clocks_with_hour_overflow() {
	c1 := new_clock(10, 37)
	c2 := new_clock(34, 37)
	assert c1 == c2
}

fn test_clocks_with_hour_overflow_by_days() {
	c1 := new_clock(3, 11)
	c2 := new_clock(99, 11)
	assert c1 == c2
}

fn test_clocks_with_negative_hour() {
	c1 := new_clock(22, 40)
	c2 := new_clock(-2, 40)
	assert c1 == c2
}

fn test_clocks_with_negative_hour_that_wraps() {
	c1 := new_clock(17, 3)
	c2 := new_clock(-31, 3)
	assert c1 == c2
}

fn test_clocks_with_negative_hour_that_wraps_multiple_times() {
	c1 := new_clock(13, 49)
	c2 := new_clock(-83, 49)
	assert c1 == c2
}

fn test_clocks_with_minute_overflow() {
	c1 := new_clock(0, 1)
	c2 := new_clock(0, 1441)
	assert c1 == c2
}

fn test_clocks_with_minute_overflow_by_days() {
	c1 := new_clock(2, 2)
	c2 := new_clock(2, 4322)
	assert c1 == c2
}

fn test_clocks_with_negative_minute() {
	c1 := new_clock(2, 40)
	c2 := new_clock(3, -20)
	assert c1 == c2
}

fn test_clocks_with_negative_minute_that_wraps() {
	c1 := new_clock(4, 10)
	c2 := new_clock(5, -1490)
	assert c1 == c2
}

fn test_clocks_with_negative_minute_that_wraps_multiple_times() {
	c1 := new_clock(6, 15)
	c2 := new_clock(6, -4305)
	assert c1 == c2
}

fn test_clocks_with_negative_hour_and_minute() {
	c1 := new_clock(7, 32)
	c2 := new_clock(-12, -268)
	assert c1 == c2
}

fn test_clocks_with_negative_hour_and_minute_that_wrap() {
	c1 := new_clock(18, 7)
	c2 := new_clock(-54, -11513)
	assert c1 == c2
}

fn test_full_clock_and_zeroed_clock() {
	c1 := new_clock(24, 0)
	c2 := new_clock(0, 0)
	assert c1 == c2
}
