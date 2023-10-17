module main

fn test_0_eggs() {
	assert egg_count(0) == 0
}

fn test_1_egg() {
	assert egg_count(16) == 1
}

fn test_4_eggs() {
	assert egg_count(89) == 4
}

fn test_13_eggs() {
	assert egg_count(2000000000) == 13
}
