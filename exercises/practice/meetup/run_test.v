module main

fn test_when_teenth_monday_is_the_13th_the_first_day_of_the_teenth_week() {
	assert date('The monteenth of May 2013') == '2013/5/13'
}

fn test_when_teenth_monday_is_the_19th_the_last_day_of_the_teenth_week() {
	assert date('The monteenth of August 2013') == '2013/8/19'
}

fn test_when_teenth_monday_is_some_day_in_the_middle_of_the_teenth_week() {
	assert date('The monteenth of September 2013') == '2013/9/16'
}

fn test_when_teenth_tuesday_is_the_19th_the_last_day_of_the_teenth_week() {
	assert date('The tuesteenth of March 2013') == '2013/3/19'
}

fn test_when_teenth_tuesday_is_some_day_in_the_middle_of_the_teenth_week() {
	assert date('The tuesteenth of April 2013') == '2013/4/16'
}

fn test_when_teenth_tuesday_is_the_13th_the_first_day_of_the_teenth_week() {
	assert date('The tuesteenth of August 2013') == '2013/8/13'
}

fn test_when_teenth_wednesday_is_some_day_in_the_middle_of_the_teenth_week() {
	assert date('The wednesteenth of January 2013') == '2013/1/16'
}

fn test_when_teenth_wednesday_is_the_13th_the_first_day_of_the_teenth_week() {
	assert date('The wednesteenth of February 2013') == '2013/2/13'
}

fn test_when_teenth_wednesday_is_the_19th_the_last_day_of_the_teenth_week() {
	assert date('The wednesteenth of June 2013') == '2013/6/19'
}

fn test_when_teenth_thursday_is_some_day_in_the_middle_of_the_teenth_week() {
	assert date('The thursteenth of May 2013') == '2013/5/16'
}

fn test_when_teenth_thursday_is_the_13th_the_first_day_of_the_teenth_week() {
	assert date('The thursteenth of June 2013') == '2013/6/13'
}

fn test_when_teenth_thursday_is_the_19th_the_last_day_of_the_teenth_week() {
	assert date('The thursteenth of September 2013') == '2013/9/19'
}

fn test_when_teenth_friday_is_the_19th_the_last_day_of_the_teenth_week() {
	assert date('The friteenth of April 2013') == '2013/4/19'
}

fn test_when_teenth_friday_is_some_day_in_the_middle_of_the_teenth_week() {
	assert date('The friteenth of August 2013') == '2013/8/16'
}

fn test_when_teenth_friday_is_the_13th_the_first_day_of_the_teenth_week() {
	assert date('The friteenth of September 2013') == '2013/9/13'
}

fn test_when_teenth_saturday_is_some_day_in_the_middle_of_the_teenth_week() {
	assert date('The saturteenth of February 2013') == '2013/2/16'
}

fn test_when_teenth_saturday_is_the_13th_the_first_day_of_the_teenth_week() {
	assert date('The saturteenth of April 2013') == '2013/4/13'
}

fn test_when_teenth_saturday_is_the_19th_the_last_day_of_the_teenth_week() {
	assert date('The saturteenth of October 2013') == '2013/10/19'
}

fn test_when_teenth_sunday_is_the_19th_the_last_day_of_the_teenth_week() {
	assert date('The sunteenth of May 2013') == '2013/5/19'
}

fn test_when_teenth_sunday_is_some_day_in_the_middle_of_the_teenth_week() {
	assert date('The sunteenth of June 2013') == '2013/6/16'
}

fn test_when_teenth_sunday_is_the_13th_the_first_day_of_the_teenth_week() {
	assert date('The sunteenth of October 2013') == '2013/10/13'
}

fn test_when_first_monday_is_some_day_in_the_middle_of_the_first_week() {
	assert date('The first Monday of March 2013') == '2013/3/4'
}

fn test_when_first_monday_is_the_1st_the_first_day_of_the_first_week() {
	assert date('The first Monday of April 2013') == '2013/4/1'
}

fn test_when_first_tuesday_is_the_7th_the_last_day_of_the_first_week() {
	assert date('The first Tuesday of May 2013') == '2013/5/7'
}

fn test_when_first_tuesday_is_some_day_in_the_middle_of_the_first_week() {
	assert date('The first Tuesday of June 2013') == '2013/6/4'
}

fn test_when_first_wednesday_is_some_day_in_the_middle_of_the_first_week() {
	assert date('The first Wednesday of July 2013') == '2013/7/3'
}

fn test_when_first_wednesday_is_the_7th_the_last_day_of_the_first_week() {
	assert date('The first Wednesday of August 2013') == '2013/8/7'
}

fn test_when_first_thursday_is_some_day_in_the_middle_of_the_first_week() {
	assert date('The first Thursday of September 2013') == '2013/9/5'
}

fn test_when_first_thursday_is_another_day_in_the_middle_of_the_first_week() {
	assert date('The first Thursday of October 2013') == '2013/10/3'
}

fn test_when_first_friday_is_the_1st_the_first_day_of_the_first_week() {
	assert date('The first Friday of November 2013') == '2013/11/1'
}

fn test_when_first_friday_is_some_day_in_the_middle_of_the_first_week() {
	assert date('The first Friday of December 2013') == '2013/12/6'
}

fn test_when_first_saturday_is_some_day_in_the_middle_of_the_first_week() {
	assert date('The first Saturday of January 2013') == '2013/1/5'
}

fn test_when_first_saturday_is_another_day_in_the_middle_of_the_first_week() {
	assert date('The first Saturday of February 2013') == '2013/2/2'
}

fn test_when_first_sunday_is_some_day_in_the_middle_of_the_first_week() {
	assert date('The first Sunday of March 2013') == '2013/3/3'
}

fn test_when_first_sunday_is_the_7th_the_last_day_of_the_first_week() {
	assert date('The first Sunday of April 2013') == '2013/4/7'
}

fn test_when_second_monday_is_some_day_in_the_middle_of_the_second_week() {
	assert date('The second Monday of March 2013') == '2013/3/11'
}

fn test_when_second_monday_is_the_8th_the_first_day_of_the_second_week() {
	assert date('The second Monday of April 2013') == '2013/4/8'
}

fn test_when_second_tuesday_is_the_14th_the_last_day_of_the_second_week() {
	assert date('The second Tuesday of May 2013') == '2013/5/14'
}

fn test_when_second_tuesday_is_some_day_in_the_middle_of_the_second_week() {
	assert date('The second Tuesday of June 2013') == '2013/6/11'
}

fn test_when_second_wednesday_is_some_day_in_the_middle_of_the_second_week() {
	assert date('The second Wednesday of July 2013') == '2013/7/10'
}

fn test_when_second_wednesday_is_the_14th_the_last_day_of_the_second_week() {
	assert date('The second Wednesday of August 2013') == '2013/8/14'
}

fn test_when_second_thursday_is_some_day_in_the_middle_of_the_second_week() {
	assert date('The second Thursday of September 2013') == '2013/9/12'
}

fn test_when_second_thursday_is_another_day_in_the_middle_of_the_second_week() {
	assert date('The second Thursday of October 2013') == '2013/10/10'
}

fn test_when_second_friday_is_the_8th_the_first_day_of_the_second_week() {
	assert date('The second Friday of November 2013') == '2013/11/8'
}

fn test_when_second_friday_is_some_day_in_the_middle_of_the_second_week() {
	assert date('The second Friday of December 2013') == '2013/12/13'
}

fn test_when_second_saturday_is_some_day_in_the_middle_of_the_second_week() {
	assert date('The second Saturday of January 2013') == '2013/1/12'
}

fn test_when_second_saturday_is_another_day_in_the_middle_of_the_second_week() {
	assert date('The second Saturday of February 2013') == '2013/2/9'
}

fn test_when_second_sunday_is_some_day_in_the_middle_of_the_second_week() {
	assert date('The second Sunday of March 2013') == '2013/3/10'
}

fn test_when_second_sunday_is_the_14th_the_last_day_of_the_second_week() {
	assert date('The second Sunday of April 2013') == '2013/4/14'
}

fn test_when_third_monday_is_some_day_in_the_middle_of_the_third_week() {
	assert date('The third Monday of March 2013') == '2013/3/18'
}

fn test_when_third_monday_is_the_15th_the_first_day_of_the_third_week() {
	assert date('The third Monday of April 2013') == '2013/4/15'
}

fn test_when_third_tuesday_is_the_21st_the_last_day_of_the_third_week() {
	assert date('The third Tuesday of May 2013') == '2013/5/21'
}

fn test_when_third_tuesday_is_some_day_in_the_middle_of_the_third_week() {
	assert date('The third Tuesday of June 2013') == '2013/6/18'
}

fn test_when_third_wednesday_is_some_day_in_the_middle_of_the_third_week() {
	assert date('The third Wednesday of July 2013') == '2013/7/17'
}

fn test_when_third_wednesday_is_the_21st_the_last_day_of_the_third_week() {
	assert date('The third Wednesday of August 2013') == '2013/8/21'
}

fn test_when_third_thursday_is_some_day_in_the_middle_of_the_third_week() {
	assert date('The third Thursday of September 2013') == '2013/9/19'
}

fn test_when_third_thursday_is_another_day_in_the_middle_of_the_third_week() {
	assert date('The third Thursday of October 2013') == '2013/10/17'
}

fn test_when_third_friday_is_the_15th_the_first_day_of_the_third_week() {
	assert date('The third Friday of November 2013') == '2013/11/15'
}

fn test_when_third_friday_is_some_day_in_the_middle_of_the_third_week() {
	assert date('The third Friday of December 2013') == '2013/12/20'
}

fn test_when_third_saturday_is_some_day_in_the_middle_of_the_third_week() {
	assert date('The third Saturday of January 2013') == '2013/1/19'
}

fn test_when_third_saturday_is_another_day_in_the_middle_of_the_third_week() {
	assert date('The third Saturday of February 2013') == '2013/2/16'
}

fn test_when_third_sunday_is_some_day_in_the_middle_of_the_third_week() {
	assert date('The third Sunday of March 2013') == '2013/3/17'
}

fn test_when_third_sunday_is_the_21st_the_last_day_of_the_third_week() {
	assert date('The third Sunday of April 2013') == '2013/4/21'
}

fn test_when_fourth_monday_is_some_day_in_the_middle_of_the_fourth_week() {
	assert date('The fourth Monday of March 2013') == '2013/3/25'
}

fn test_when_fourth_monday_is_the_22nd_the_first_day_of_the_fourth_week() {
	assert date('The fourth Monday of April 2013') == '2013/4/22'
}

fn test_when_fourth_tuesday_is_the_28th_the_last_day_of_the_fourth_week() {
	assert date('The fourth Tuesday of May 2013') == '2013/5/28'
}

fn test_when_fourth_tuesday_is_some_day_in_the_middle_of_the_fourth_week() {
	assert date('The fourth Tuesday of June 2013') == '2013/6/25'
}

fn test_when_fourth_wednesday_is_some_day_in_the_middle_of_the_fourth_week() {
	assert date('The fourth Wednesday of July 2013') == '2013/7/24'
}

fn test_when_fourth_wednesday_is_the_28th_the_last_day_of_the_fourth_week() {
	assert date('The fourth Wednesday of August 2013') == '2013/8/28'
}

fn test_when_fourth_thursday_is_some_day_in_the_middle_of_the_fourth_week() {
	assert date('The fourth Thursday of September 2013') == '2013/9/26'
}

fn test_when_fourth_thursday_is_another_day_in_the_middle_of_the_fourth_week() {
	assert date('The fourth Thursday of October 2013') == '2013/10/24'
}

fn test_when_fourth_friday_is_the_22nd_the_first_day_of_the_fourth_week() {
	assert date('The fourth Friday of November 2013') == '2013/11/22'
}

fn test_when_fourth_friday_is_some_day_in_the_middle_of_the_fourth_week() {
	assert date('The fourth Friday of December 2013') == '2013/12/27'
}

fn test_when_fourth_saturday_is_some_day_in_the_middle_of_the_fourth_week() {
	assert date('The fourth Saturday of January 2013') == '2013/1/26'
}

fn test_when_fourth_saturday_is_another_day_in_the_middle_of_the_fourth_week() {
	assert date('The fourth Saturday of February 2013') == '2013/2/23'
}

fn test_when_fourth_sunday_is_some_day_in_the_middle_of_the_fourth_week() {
	assert date('The fourth Sunday of March 2013') == '2013/3/24'
}

fn test_when_fourth_sunday_is_the_28th_the_last_day_of_the_fourth_week() {
	assert date('The fourth Sunday of April 2013') == '2013/4/28'
}

fn test_last_monday_in_a_month_with_four_mondays() {
	assert date('The last Monday of March 2013') == '2013/3/25'
}

fn test_last_monday_in_a_month_with_five_mondays() {
	assert date('The last Monday of April 2013') == '2013/4/29'
}

fn test_last_tuesday_in_a_month_with_four_tuesdays() {
	assert date('The last Tuesday of May 2013') == '2013/5/28'
}

fn test_last_tuesday_in_another_month_with_four_tuesdays() {
	assert date('The last Tuesday of June 2013') == '2013/6/25'
}

fn test_last_wednesday_in_a_month_with_five_wednesdays() {
	assert date('The last Wednesday of July 2013') == '2013/7/31'
}

fn test_last_wednesday_in_a_month_with_four_wednesdays() {
	assert date('The last Wednesday of August 2013') == '2013/8/28'
}

fn test_last_thursday_in_a_month_with_four_thursdays() {
	assert date('The last Thursday of September 2013') == '2013/9/26'
}

fn test_last_thursday_in_a_month_with_five_thursdays() {
	assert date('The last Thursday of October 2013') == '2013/10/31'
}

fn test_last_friday_in_a_month_with_five_fridays() {
	assert date('The last Friday of November 2013') == '2013/11/29'
}

fn test_last_friday_in_a_month_with_four_fridays() {
	assert date('The last Friday of December 2013') == '2013/12/27'
}

fn test_last_saturday_in_a_month_with_four_saturdays() {
	assert date('The last Saturday of January 2013') == '2013/1/26'
}

fn test_last_saturday_in_another_month_with_four_saturdays() {
	assert date('The last Saturday of February 2013') == '2013/2/23'
}

fn test_last_sunday_in_a_month_with_five_sundays() {
	assert date('The last Sunday of March 2013') == '2013/3/31'
}

fn test_last_sunday_in_a_month_with_four_sundays() {
	assert date('The last Sunday of April 2013') == '2013/4/28'
}

fn test_when_last_wednesday_in_february_in_a_leap_year_is_the_29th() {
	assert date('The last Wednesday of February 2012') == '2012/2/29'
}

fn test_last_wednesday_in_december_that_is_also_the_last_day_of_the_year() {
	assert date('The last Wednesday of December 2014') == '2014/12/31'
}

fn test_when_last_sunday_in_february_in_a_non_leap_year_is_not_the_29th() {
	assert date('The last Sunday of February 2015') == '2015/2/22'
}

fn test_when_first_friday_is_the_7th_the_last_day_of_the_first_week() {
	assert date('The first Friday of December 2012') == '2012/12/7'
}
