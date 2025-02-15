module main

fn test_zero_pieces() {
	strings := []string{}
	expected := ''
	assert recite(strings) == expected
}

fn test_one_piece() {
	strings := ['nail']
	expected := ('And all for the want of a nail.')
	assert recite(strings) == expected
}

fn test_two_pieces() {
	strings := ['nail', 'shoe']
	expected := ('For want of a nail the shoe was lost.
And all for the want of a nail.')
	assert recite(strings) == expected
}

fn test_three_pieces() {
	strings := ['nail', 'shoe', 'horse']
	expected := ('For want of a nail the shoe was lost.
For want of a shoe the horse was lost.
And all for the want of a nail.')
	assert recite(strings) == expected
}

fn test_full_proverb() {
	strings := ['nail', 'shoe', 'horse', 'rider', 'message', 'battle', 'kingdom']
	expected := ('For want of a nail the shoe was lost.
For want of a shoe the horse was lost.
For want of a horse the rider was lost.
For want of a rider the message was lost.
For want of a message the battle was lost.
For want of a battle the kingdom was lost.
And all for the want of a nail.')
	assert recite(strings) == expected
}

fn test_four_pieces_modernized() {
	strings := ['pin', 'gun', 'soldier', 'battle']
	expected := ('For want of a pin the gun was lost.
For want of a gun the soldier was lost.
For want of a soldier the battle was lost.
And all for the want of a pin.')
	assert recite(strings) == expected
}
