module main

fn test_the_sound_for_1_is_1() {
	assert raindrops(1) == '1'
}

fn test_the_sound_for_3_is_pling() {
	assert raindrops(3) == 'Pling'
}

fn test_the_sound_for_5_is_plang() {
	assert raindrops(5) == 'Plang'
}

fn test_the_sound_for_7_is_plong() {
	assert raindrops(7) == 'Plong'
}

fn test_the_sound_for_6_is_pling_as_it_has_a_factor_3() {
	assert raindrops(6) == 'Pling'
}

fn test_2_to_the_power_3_does_not_make_a_raindrop_sound_as_3_is_the_exponent_not_the_base() {
	assert raindrops(8) == '8'
}

fn test_the_sound_for_9_is_pling_as_it_has_a_factor_3() {
	assert raindrops(9) == 'Pling'
}

fn test_the_sound_for_10_is_plang_as_it_has_a_factor_5() {
	assert raindrops(10) == 'Plang'
}

fn test_the_sound_for_14_is_plong_as_it_has_a_factor_of_7() {
	assert raindrops(14) == 'Plong'
}

fn test_the_sound_for_15_is_plingplang_as_it_has_factors_3_and_5() {
	assert raindrops(15) == 'PlingPlang'
}

fn test_the_sound_for_21_is_plingplong_as_it_has_factors_3_and_7() {
	assert raindrops(21) == 'PlingPlong'
}

fn test_the_sound_for_25_is_plang_as_it_has_a_factor_5() {
	assert raindrops(25) == 'Plang'
}

fn test_the_sound_for_27_is_pling_as_it_has_a_factor_3() {
	assert raindrops(27) == 'Pling'
}

fn test_the_sound_for_35_is_plangplong_as_it_has_factors_5_and_7() {
	assert raindrops(35) == 'PlangPlong'
}

fn test_the_sound_for_49_is_plong_as_it_has_a_factor_7() {
	assert raindrops(49) == 'Plong'
}

fn test_the_sound_for_52_is_52() {
	assert raindrops(52) == '52'
}

fn test_the_sound_for_105_is_plingplangplong_as_it_has_factors_3_5_and_7() {
	assert raindrops(105) == 'PlingPlangPlong'
}

fn test_the_sound_for_3125_is_plang_as_it_has_a_factor_5() {
	assert raindrops(3125) == 'Plang'
}
