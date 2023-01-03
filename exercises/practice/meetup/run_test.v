module main

fn test_monteenth_13th() {
	assert date('The monteenth of May 2013') == '2013/5/13'
}

fn test_monteenth_19th() {
	assert date('The monteenth of August 2013') == '2013/8/19'
}

fn test_monteenth_16th() {
	assert date('The monteenth of September 2013') == '2013/9/16'
}

fn test_tuesteenth_19th() {
	assert date('The tuesteenth of March 2013') == '2013/3/19'
}

fn test_tuesteenth_16th() {
	assert date('The tuesteenth of April 2013') == '2013/4/16'
}

fn test_tuesteenth_13th() {
	assert date('The tuesteenth of August 2013') == '2013/8/13'
}

fn test_wednesteenth_middle() {
	assert date('The wednesteenth of January 2013') == '2013/1/16'
}

fn test_wednesteenth_13th() {
	assert date('The wednesteenth of February 2013') == '2013/2/13'
}

fn test_wednesteenth_19th() {
	assert date('The wednesteenth of June 2013') == '2013/6/19'
}

fn test_thursteenth_middle() {
	assert date('The thursteenth of May 2013') == '2013/5/16'
}

fn test_thursteenth_13th() {
	assert date('The thursteenth of June 2013') == '2013/6/13'
}

fn test_thursteenth_19th() {
	assert date('The thursteenth of September 2013') == '2013/9/19'
}

fn test_friteenth_19th() {
	assert date('The friteenth of April 2013') == '2013/4/19'
}

fn test_friteenth_middle() {
	assert date('The friteenth of August 2013') == '2013/8/16'
}

fn test_friteenth_13th() {
	assert date('The friteenth of September 2013') == '2013/9/13'
}

fn test_saturteenth_middle() {
	assert date('The saturteenth of February 2013') == '2013/2/16'
}

fn test_saturteenth_13th() {
	assert date('The saturteenth of April 2013') == '2013/4/13'
}

fn test_saturteenth_19th() {
	assert date('The saturteenth of October 2013') == '2013/10/19'
}

fn test_sunteenth_19th() {
	assert date('The sunteenth of May 2013') == '2013/5/19'
}

fn test_sunteenth_middle() {
	assert date('The sunteenth of June 2013') == '2013/6/16'
}

fn test_sunteenth_13th() {
	assert date('The sunteenth of October 2013') == '2013/10/13'
}

fn test_first_monday_some_day() {
	assert date('The first Monday of March 2013') == '2013/3/4'
}

fn test_first_monday_1st() {
	assert date('The first Monday of April 2013') == '2013/4/1'
}

fn test_first_tuesday_7th() {
	assert date('The first Tuesday of May 2013') == '2013/5/7'
}

fn test_first_tuesday_some_day() {
	assert date('The first Tuesday of June 2013') == '2013/6/4'
}

fn test_first_wednesday_some_day() {
	assert date('The first Wednesday of July 2013') == '2013/7/3'
}

fn test_first_wednesday_last_day() {
	assert date('The first Wednesday of August 2013') == '2013/8/7'
}

fn test_first_thursday_some_day() {
	assert date('The first Thursday of September 2013') == '2013/9/5'
}

fn test_first_thursday_another_day() {
	assert date('The first Thursday of October 2013') == '2013/10/3'
}

fn test_first_friday_some_day() {
	assert date('The first Friday of December 2013') == '2013/12/6'
}

fn test_first_saturday_some_day() {
	assert date('The first Saturday of January 2013') == '2013/1/5'
}

fn test_first_saturday_another_day() {
	assert date('The first Saturday of February 2013') == '2013/2/2'
}

fn test_first_sunday_some_day() {
	assert date('The first Sunday of March 2013') == '2013/3/3'
}

fn test_first_sunday_last_day_of_first_week() {
	assert date('The first Sunday of April 2013') == '2013/4/7'
}

fn test_second_monday_middle_of_second_week() {
	assert date('The second Monday of March 2013') == '2013/3/11'
}

fn test_second_monday_first_day_of_second_week() {
	assert date('The second Monday of April 2013') == '2013/4/8'
}

fn test_second_tuesday_last_day_of_second_week() {
	assert date('The second Tuesday of May 2013') == '2013/5/14'
}

fn test_second_tuesday_middle_of_second_week() {
	assert date('The second Tuesday of June 2013') == '2013/6/11'
}

fn test_second_wednesday_middle_of_second_week() {
	assert date('The second Wednesday of July 2013') == '2013/7/10'
}

fn test_second_wednesday_end_of_second_week() {
	assert date('The second Wednesday of August 2013') == '2013/8/14'
}

fn test_second_thursday_middle_of_second_week() {
	assert date('The second Thursday of September 2013') == '2013/9/12'
}

fn test_second_thursday_another_middle_of_second_week() {
	assert date('The second Thursday of October 2013') == '2013/10/10'
}

fn test_second_friday_start_of_second_week() {
	assert date('The second Friday of November 2013') == '2013/11/8'
}

fn test_second_friday_middle_of_second_week() {
	assert date('The second Friday of December 2013') == '2013/12/13'
}

fn test_second_saturday_middle_of_second_week() {
	assert date('The second Saturday of January 2013') == '2013/1/12'
}

fn test_second_saturday_also_middle_of_second_week() {
	assert date('The second Saturday of February 2013') == '2013/2/9'
}

fn test_second_sunday_middle_of_second_week() {
	assert date('The second Sunday of March 2013') == '2013/3/10'
}

fn test_second_sunday_end_of_second_week() {
	assert date('The second Sunday of April 2013') == '2013/4/14'
}

fn test_third_monday_middle_of_third_week() {
	assert date('The third Monday of March 2013') == '2013/3/18'
}

fn test_third_monday_beginning_of_third_week() {
	assert date('The third Monday of April 2013') == '2013/4/15'
}

fn test_third_tuesday_end_of_third_week() {
	assert date('The third Tuesday of May 2013') == '2013/5/21'
}

fn test_third_tuesday_middle_of_third_week() {
	assert date('The third Tuesday of June 2013') == '2013/6/18'
}

fn test_third_wednesday_middle_of_third_week() {
	assert date('The third Wednesday of July 2013') == '2013/7/17'
}

fn test_third_wednesday_end_of_third_week() {
	assert date('The third Wednesday of August 2013') == '2013/8/21'
}

fn test_third_thursday_middle_of_third_week() {
	assert date('The third Thursday of September 2013') == '2013/9/19'
}

fn test_third_friday_15th() {
	assert date('The third Friday of November 2013') == '2013/11/15'
}

fn test_third_friday_20th() {
	assert date('The third Friday of December 2013') == '2013/12/20'
}

fn test_third_saturday_19th() {
	assert date('The third Saturday of January 2013') == '2013/1/19'
}

fn test_third_saturday_16th() {
	assert date('The third Saturday of February 2013') == '2013/2/16'
}

fn test_third_sunday_17th() {
	assert date('The third Sunday of March 2013') == '2013/3/17'
}

fn test_third_sunday_21st() {
	assert date('The third Sunday of April 2013') == '2013/4/21'
}

fn test_fourth_monday_25th() {
	assert date('The fourth Monday of March 2013') == '2013/3/25'
}

fn test_fourth_monday_22nd() {
	assert date('The fourth Monday of April 2013') == '2013/4/22'
}

fn test_fourth_tuesday_28th() {
	assert date('The fourth Tuesday of May 2013') == '2013/5/28'
}

fn test_fourth_tuesday_25th() {
	assert date('The fourth Tuesday of June 2013') == '2013/6/25'
}

fn test_fourth_wednesday_24th() {
	assert date('The fourth Wednesday of July 2013') == '2013/7/24'
}

fn test_fourth_wednesday_28th() {
	assert date('The fourth Wednesday of August 2013') == '2013/8/28'
}

fn test_fourth_thursday_26th() {
	assert date('The fourth Thursday of September 2013') == '2013/9/26'
}

fn test_fourth_thursday_24th() {
	assert date('The fourth Thursday of October 2013') == '2013/10/24'
}

fn test_fourth_friday_22nd() {
	assert date('The fourth Friday of November 2013') == '2013/11/22'
}

fn test_fourth_friday_27th() {
	assert date('The fourth Friday of December 2013') == '2013/12/27'
}

fn test_fourth_saturday_26th() {
	assert date('The fourth Saturday of January 2013') == '2013/1/26'
}

fn test_fourth_saturday_23rd() {
	assert date('The fourth Saturday of February 2013') == '2013/2/23'
}

fn test_fourth_sunday_24th() {
	assert date('The fourth Sunday of March 2013') == '2013/3/24'
}

fn test_fourth_sunday_28th() {
	assert date('The fourth Sunday of April 2013') == '2013/4/28'
}

fn test_last_monday_four_mondays() {
	assert date('The last Monday of March 2013') == '2013/3/25'
}

fn test_last_monday_five_mondays() {
	assert date('The last Monday of April 2013') == '2013/4/29'
}

fn test_last_tuesday_four_tuesdays() {
	assert date('The last Tuesday of May 2013') == '2013/5/28'
}

fn test_last_tuesday_four_tuesdays_too() {
	assert date('The last Tuesday of June 2013') == '2013/6/25'
}

fn test_last_wednesday_four_wednesdays() {
	assert date('The last Wednesday of July 2013') == '2013/7/31'
}

fn test_last_wednesday_five_wednesdays() {
	assert date('The last Wednesday of August 2013') == '2013/8/28'
}

fn test_last_thursday_four_thursdays() {
	assert date('The last Thursday of September 2013') == '2013/9/26'
}

fn test_last_thursday_five_thursdays() {
	assert date('The last Thursday of October 2013') == '2013/10/31'
}

fn test_last_friday_five_fridays() {
	assert date('The last Friday of November 2013') == '2013/11/29'
}

fn test_last_friday_four_fridays() {
	assert date('The last Friday of December 2013') == '2013/12/27'
}

fn test_last_saturday_four_saturdays() {
	assert date('The last Saturday of January 2013') == '2013/1/26'
}

fn test_last_saturday_four_saturdays_too() {
	assert date('The last Saturday of February 2013') == '2013/2/23'
}

fn test_last_sunday_five_sundays() {
	assert date('The last Sunday of March 2013') == '2013/3/31'
}

fn test_last_sunday_four_sundays() {
	assert date('The last Sunday of April 2013') == '2013/4/28'
}

fn test_when_leap_year_last_wednesday_is_29th() {
	assert date('The last Wednesday of February 2012') == '2012/2/29'
}

fn test_last_day_december_also_last_of_year() {
	assert date('The last Wednesday of December 2014') == '2014/12/31'
}

fn test_last_sunday_in_feb_non_leap_year() {
	assert date('The last Sunday of February 2015') == '2015/2/22'
}

fn test_first_friday_7th() {
	assert date('The first Friday of December 2012') == '2012/12/7'
}
