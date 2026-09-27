module main

fn test_single_hand_always_wins() {
	hands := ['4S 5S 7H 8D JC']
	expected := ['4S 5S 7H 8D JC']
	assert best_hands(hands)! == expected
}

fn test_highest_card_out_of_all_hands_wins() {
	hands := ['4D 5S 6S 8D 3C', '2S 4C 7S 9H 10H', '3S 4S 5D 6H JH']
	expected := ['3S 4S 5D 6H JH']
	assert best_hands(hands)! == expected
}

fn test_a_tie_has_multiple_winners() {
	hands := ['4D 5S 6S 8D 3C', '2S 4C 7S 9H 10H', '3S 4S 5D 6H JH', '3H 4H 5C 6C JD']
	expected := ['3S 4S 5D 6H JH', '3H 4H 5C 6C JD']
	assert best_hands(hands)! == expected
}

fn test_multiple_hands_with_the_same_high_cards_tie_compares_next_highest_ranked_down_to_last_card() {
	hands := ['3S 5H 6S 8D 7H', '2S 5D 6D 8C 7S']
	expected := ['3S 5H 6S 8D 7H']
	assert best_hands(hands)! == expected
}

fn test_winning_high_card_hand_also_has_the_lowest_card() {
	hands := ['2S 5H 6S 8D 7H', '3S 4D 6D 8C 7S']
	expected := ['2S 5H 6S 8D 7H']
	assert best_hands(hands)! == expected
}

fn test_one_pair_beats_high_card() {
	hands := ['4S 5H 6C 8D KH', '2S 4H 6S 4D JH']
	expected := ['2S 4H 6S 4D JH']
	assert best_hands(hands)! == expected
}

fn test_highest_pair_wins() {
	hands := ['4S 2H 6S 2D JH', '2S 4H 6C 4D JD']
	expected := ['2S 4H 6C 4D JD']
	assert best_hands(hands)! == expected
}

fn test_both_hands_have_the_same_pair_high_card_wins() {
	hands := ['4H 4S AH JC 3D', '4C 4D AS 5D 6C']
	expected := ['4H 4S AH JC 3D']
	assert best_hands(hands)! == expected
}

fn test_two_pairs_beats_one_pair() {
	hands := ['2S 8H 6S 8D JH', '4S 5H 4C 8C 5C']
	expected := ['4S 5H 4C 8C 5C']
	assert best_hands(hands)! == expected
}

fn test_both_hands_have_two_pairs_highest_ranked_pair_wins() {
	hands := ['2S 8H 2D 8D 3H', '4S 5H 4C 8S 5D']
	expected := ['2S 8H 2D 8D 3H']
	assert best_hands(hands)! == expected
}

fn test_both_hands_have_two_pairs_with_the_same_highest_ranked_pair_tie_goes_to_low_pair() {
	hands := ['2S QS 2C QD JH', 'JD QH JS 8D QC']
	expected := ['JD QH JS 8D QC']
	assert best_hands(hands)! == expected
}

fn test_both_hands_have_two_identically_ranked_pairs_tie_goes_to_remaining_card_kicker() {
	hands := ['JD QH JS 8D QC', 'JS QS JC 2D QD']
	expected := ['JD QH JS 8D QC']
	assert best_hands(hands)! == expected
}

fn test_both_hands_have_two_pairs_that_add_to_the_same_value_win_goes_to_highest_pair() {
	hands := ['6S 6H 3S 3H AS', '7H 7S 2H 2S AC']
	expected := ['7H 7S 2H 2S AC']
	assert best_hands(hands)! == expected
}

fn test_two_pairs_first_ranked_by_largest_pair() {
	hands := ['5C 2S 5S 4H 4C', '6S 2S 6H 7C 2C']
	expected := ['6S 2S 6H 7C 2C']
	assert best_hands(hands)! == expected
}

fn test_three_of_a_kind_beats_two_pair() {
	hands := ['2S 8H 2H 8D JH', '4S 5H 4C 8S 4H']
	expected := ['4S 5H 4C 8S 4H']
	assert best_hands(hands)! == expected
}

fn test_both_hands_have_three_of_a_kind_tie_goes_to_highest_ranked_triplet() {
	hands := ['2S 2H 2C 8D JH', '4S AH AS 8C AD']
	expected := ['4S AH AS 8C AD']
	assert best_hands(hands)! == expected
}

fn test_with_multiple_decks_two_players_can_have_same_three_of_a_kind_ties_go_to_highest_remaining_cards() {
	hands := ['4S AH AS 7C AD', '4S AH AS 8C AD']
	expected := ['4S AH AS 8C AD']
	assert best_hands(hands)! == expected
}

fn test_a_straight_beats_three_of_a_kind() {
	hands := ['4S 5H 4C 8D 4H', '3S 4D 2S 6D 5C']
	expected := ['3S 4D 2S 6D 5C']
	assert best_hands(hands)! == expected
}

fn test_aces_can_end_a_straight_10_j_q_k_a() {
	hands := ['4S 5H 4C 8D 4H', '10D JH QS KD AC']
	expected := ['10D JH QS KD AC']
	assert best_hands(hands)! == expected
}

fn test_aces_can_start_a_straight_a_2_3_4_5() {
	hands := ['4S 5H 4C 8D 4H', '4D AH 3S 2D 5C']
	expected := ['4D AH 3S 2D 5C']
	assert best_hands(hands)! == expected
}

fn test_aces_cannot_be_in_the_middle_of_a_straight_q_k_a_2_3() {
	hands := ['2C 3D 7H 5H 2S', 'QS KH AC 2D 3S']
	expected := ['2C 3D 7H 5H 2S']
	assert best_hands(hands)! == expected
}

fn test_both_hands_with_a_straight_tie_goes_to_highest_ranked_card() {
	hands := ['4S 6C 7S 8D 5H', '5S 7H 8S 9D 6H']
	expected := ['5S 7H 8S 9D 6H']
	assert best_hands(hands)! == expected
}

fn test_even_though_an_ace_is_usually_high_a_5_high_straight_is_the_lowest_scoring_straight() {
	hands := ['2H 3C 4D 5D 6H', '4S AH 3S 2D 5H']
	expected := ['2H 3C 4D 5D 6H']
	assert best_hands(hands)! == expected
}

fn test_flush_beats_a_straight() {
	hands := ['4C 6H 7D 8D 5H', '2S 4S 5S 6S 7S']
	expected := ['2S 4S 5S 6S 7S']
	assert best_hands(hands)! == expected
}

fn test_both_hands_have_a_flush_tie_goes_to_high_card_down_to_the_last_one_if_necessary() {
	hands := ['4H 7H 8H 9H 6H', '2S 4S 5S 6S 7S']
	expected := ['4H 7H 8H 9H 6H']
	assert best_hands(hands)! == expected
}

fn test_full_house_beats_a_flush() {
	hands := ['3H 6H 7H 8H 5H', '4S 5H 4C 5D 4H']
	expected := ['4S 5H 4C 5D 4H']
	assert best_hands(hands)! == expected
}

fn test_both_hands_have_a_full_house_tie_goes_to_highest_ranked_triplet() {
	hands := ['4H 4S 4D 9S 9D', '5H 5S 5D 8S 8D']
	expected := ['5H 5S 5D 8S 8D']
	assert best_hands(hands)! == expected
}

fn test_with_multiple_decks_both_hands_have_a_full_house_with_the_same_triplet_tie_goes_to_the_pair() {
	hands := ['5H 5S 5D 9S 9D', '5H 5S 5D 8S 8D']
	expected := ['5H 5S 5D 9S 9D']
	assert best_hands(hands)! == expected
}

fn test_four_of_a_kind_beats_a_full_house() {
	hands := ['4S 5H 4D 5D 4H', '3S 3H 2S 3D 3C']
	expected := ['3S 3H 2S 3D 3C']
	assert best_hands(hands)! == expected
}

fn test_both_hands_have_four_of_a_kind_tie_goes_to_high_quad() {
	hands := ['2S 2H 2C 8D 2D', '4S 5H 5S 5D 5C']
	expected := ['4S 5H 5S 5D 5C']
	assert best_hands(hands)! == expected
}

fn test_with_multiple_decks_both_hands_with_identical_four_of_a_kind_tie_determined_by_kicker() {
	hands := ['3S 3H 2S 3D 3C', '3S 3H 4S 3D 3C']
	expected := ['3S 3H 4S 3D 3C']
	assert best_hands(hands)! == expected
}

fn test_straight_flush_beats_four_of_a_kind() {
	hands := ['4S 5H 5S 5D 5C', '7S 8S 9S 6S 10S']
	expected := ['7S 8S 9S 6S 10S']
	assert best_hands(hands)! == expected
}

fn test_aces_can_end_a_straight_flush_10_j_q_k_a() {
	hands := ['KC AH AS AD AC', '10C JC QC KC AC']
	expected := ['10C JC QC KC AC']
	assert best_hands(hands)! == expected
}

fn test_aces_can_start_a_straight_flush_a_2_3_4_5() {
	hands := ['KS AH AS AD AC', '4H AH 3H 2H 5H']
	expected := ['4H AH 3H 2H 5H']
	assert best_hands(hands)! == expected
}

fn test_aces_cannot_be_in_the_middle_of_a_straight_flush_q_k_a_2_3() {
	hands := ['2C AC QC 10C KC', 'QH KH AH 2H 3H']
	expected := ['2C AC QC 10C KC']
	assert best_hands(hands)! == expected
}

fn test_both_hands_have_a_straight_flush_tie_goes_to_highest_ranked_card() {
	hands := ['4H 6H 7H 8H 5H', '5S 7S 8S 9S 6S']
	expected := ['5S 7S 8S 9S 6S']
	assert best_hands(hands)! == expected
}

fn test_even_though_an_ace_is_usually_high_a_5_high_straight_flush_is_the_lowest_scoring_straight_flush() {
	hands := ['2H 3H 4H 5H 6H', '4D AD 3D 2D 5D']
	expected := ['2H 3H 4H 5H 6H']
	assert best_hands(hands)! == expected
}
