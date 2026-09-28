module main

// A character: the six ability scores it rolled and its starting hitpoints.
struct Character {
	strength     int
	dexterity    int
	constitution int
	intelligence int
	wisdom       int
	charisma     int
	hitpoints    int
}

// The ability modifier of an ability `score`: the score minus ten, halved and
// rounded down.
fn modifier(score int) int {
}

// A random ability score: roll four six sided dice and sum the largest three.
fn ability() int {
}

// A random character: six fresh ability scores, and starting hitpoints equal
// to ten plus the constitution modifier.
fn character() Character {
}
