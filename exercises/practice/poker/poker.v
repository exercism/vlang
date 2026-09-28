module main

// Pick the best hand or hands from a list of poker hands.
//
// Each hand is written as its five cards separated by single spaces, as in
// '4S 5S 7H 8D JC'. A card is a rank and a suit: ranks run from 2 to 10 and
// then J, Q, K, A, with a ten written '10' as in '10H', and suits are C, D, H
// and S. The hands may share cards and may come from more than one deck.
//
// best_hands returns the strongest hand, or every hand that ties for first
// place, in the order the hands were given, so a hand that wins a tie is
// reported as often as it wins.
//
// Hands are ranked from the strongest down: straight flush, four of a kind,
// full house, flush, straight, three of a kind, two pairs, one pair, and last a
// high card. When two hands are of the same kind, the one with the better of
// the ranks that make the kind wins, and the ranks are compared from the most
// important one down. A pair is judged by the pair and then by its three
// kickers, two pairs by the higher pair, the lower pair and then the kicker,
// three of a kind by the triplet and then by its two kickers, a full house by
// the triplet and then by the pair, four of a kind by the four and then by the
// kicker, and a flush or a high card by all five cards from the highest down.
//
// An ace is the highest rank of all, but it can also end a straight, 10 J Q K
// A, or start the lowest one, A 2 3 4 5, which is then a five high straight.
// It cannot sit in the middle of a straight, so Q K A 2 3 is not one.
fn best_hands(hands []string) ![]string {
}
