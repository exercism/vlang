module main

// The number of cards in a hand.
const hand_size = 5

// The categories a hand can fall into, weakest first. The first number of a
// hand's score is its category, so two hands are separated by category before
// any of their ranks is looked at.
const high_card = 1
const pair = 2
const two_pairs = 3
const three_of_a_kind = 4
const straight = 5
const flush = 6
const full_house = 7
const four_of_a_kind = 8
const straight_flush = 9

// A single playing card: its rank and its suit.
struct Card {
	rank int // 2 to 14, counting an ace as 14
	suit u8  // one of C, D, H, S
}

// best_hands picks the strongest hand, or every hand that ties for first place,
// out of `hands`. Each hand is written as its five cards separated by single
// spaces, as in '4S 5S 7H 8D JC', and a ten is written '10' as in '10H'. Ranks
// are 2 to 10 followed by J, Q, K, A, and suits are C, D, H, S.
//
// The hands come back in the order they were given, so a hand that ties with
// another one is reported as often as it wins.
fn best_hands(hands []string) ![]string {
	mut best_score := []int{}
	mut winners := []string{}
	for hand in hands {
		cards := parse_hand(hand)!
		score := score_hand(cards)
		if winners.len == 0 || beats(score, best_score) {
			best_score = score.clone()
			winners = [hand]
		} else if score == best_score {
			winners << hand
		}
	}
	return winners
}

// parse_hand reads a whole hand, as in '4S 5S 7H 8D JC'.
fn parse_hand(hand string) ![]Card {
	tokens := hand.split(' ')
	if tokens.len != hand_size {
		return error('a hand is ${hand_size} cards: ${hand}')
	}
	mut cards := []Card{cap: tokens.len}
	for token in tokens {
		cards << parse_card(token)!
	}
	return cards
}

// parse_card reads a single card, as in '4S' or '10H'.
fn parse_card(text string) !Card {
	if text.len < 2 || text.len > 3 {
		return error('a card is a rank and a suit, as in 4S or 10H: ${text}')
	}
	suit := text[text.len - 1]
	if suit != `C` && suit != `D` && suit != `H` && suit != `S` {
		return error('a suit is C, D, H or S: ${text}')
	}
	return Card{
		rank: rank_value(text[..text.len - 1])!
		suit: suit
	}
}

// rank_value gives the number a rank is worth when hands are compared, so a
// two is 2, a king is 13 and an ace is the highest rank of all at 14.
fn rank_value(rank string) !int {
	return match rank {
		'2' { 2 }
		'3' { 3 }
		'4' { 4 }
		'5' { 5 }
		'6' { 6 }
		'7' { 7 }
		'8' { 8 }
		'9' { 9 }
		'10' { 10 }
		'J' { 11 }
		'Q' { 12 }
		'K' { 13 }
		'A' { 14 }
		else { return error('a rank is 2 to 10, J, Q, K or A: ${rank}') }
	}
}

// card_ranks lists the ranks of `cards` from the highest down to the lowest,
// which is the order every other comparison here wants them in. `reverse` does
// nothing in this version of the compiler, so the sorted ranks are read out from
// the back instead of being turned around in place.
fn card_ranks(cards []Card) []int {
	mut sorted := []int{cap: cards.len}
	for card in cards {
		sorted << card.rank
	}
	sorted.sort()
	mut ranks := []int{cap: sorted.len}
	for i := sorted.len - 1; i >= 0; i-- {
		ranks << sorted[i]
	}
	return ranks
}

// is_flush reports whether every card of `cards` shares one suit.
fn is_flush(cards []Card) bool {
	for card in cards[1..] {
		if card.suit != cards[0].suit {
			return false
		}
	}
	return true
}

// straight_high gives the highest rank of the straight `ranks` makes, or 0 when
// `ranks` makes no straight at all. An ace may end a straight or start one, but
// it may not sit in the middle of one, so a wheel is five high and not fourteen
// high.
fn straight_high(ranks []int) int {
	if ranks[0] == 14 && ranks[1] == 5 && ranks[2] == 4 && ranks[3] == 3 && ranks[4] == 2 {
		return 5
	}
	for i in 0 .. hand_size - 1 {
		if ranks[i] - ranks[i + 1] != 1 {
			return 0
		}
	}
	return ranks[0]
}

// score_hand turns a hand into the numbers that order it against other hands:
// its category first, then the ranks that break a tie, most important first.
// Every score is the same length, so two scores can simply be compared number
// by number, and a hand that needs no further tiebreak is padded with zeroes.
fn score_hand(cards []Card) []int {
	ranks := card_ranks(cards)
	in_flush := is_flush(cards)
	run_high := straight_high(ranks)

	// Walking the sorted ranks in runs of equal ranks groups them, and the
	// groups arrive from the highest rank down, which is the order tiebreaks
	// are wanted in.
	mut quads := 0
	mut trips := 0
	mut pairs := []int{}
	mut kickers := []int{}
	mut i := 0
	for i < ranks.len {
		mut j := i
		for j < ranks.len && ranks[j] == ranks[i] {
			j++
		}
		if j - i == 4 {
			quads = ranks[i]
		} else if j - i == 3 {
			trips = ranks[i]
		} else if j - i == 2 {
			pairs << ranks[i]
		} else if j - i == 1 {
			kickers << ranks[i]
		}
		i = j
	}

	if in_flush && run_high != 0 {
		return [straight_flush, run_high, 0, 0, 0, 0]
	}
	if quads != 0 {
		return [four_of_a_kind, quads, kickers[0], 0, 0, 0]
	}
	if trips != 0 && pairs.len == 1 {
		return [full_house, trips, pairs[0], 0, 0, 0]
	}
	if in_flush {
		return [flush, ranks[0], ranks[1], ranks[2], ranks[3], ranks[4]]
	}
	if run_high != 0 {
		return [straight, run_high, 0, 0, 0, 0]
	}
	if trips != 0 {
		return [three_of_a_kind, trips, kickers[0], kickers[1], 0, 0]
	}
	if pairs.len == 2 {
		return [two_pairs, pairs[0], pairs[1], kickers[0], 0, 0]
	}
	if pairs.len == 1 {
		return [pair, pairs[0], kickers[0], kickers[1], kickers[2], 0]
	}
	return [high_card, ranks[0], ranks[1], ranks[2], ranks[3], ranks[4]]
}

// beats reports whether the score `a` is worth more than the score `b`, by
// looking at the numbers both scores are made of from the left.
fn beats(a []int, b []int) bool {
	for i in 0 .. a.len {
		if a[i] != b[i] {
			return a[i] > b[i]
		}
	}
	return false
}
