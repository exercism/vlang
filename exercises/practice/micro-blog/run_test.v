module main

fn test_english_language_short() {
	assert truncate('Hi') == 'Hi'
}

fn test_english_language_long() {
	assert truncate('Hello there') == 'Hello'
}

fn test_german_language_short_broth() {
	assert truncate('brühe') == 'brühe'
}

fn test_german_language_long_bear_carpet_beards() {
	assert truncate('Bärteppich') == 'Bärte'
}

fn test_bulgarian_language_short_good() {
	assert truncate('Добър') == 'Добър'
}

fn test_greek_language_short_health() {
	assert truncate('υγειά') == 'υγειά'
}

fn test_maths_short() {
	assert truncate('a=πr²') == 'a=πr²'
}

fn test_maths_long() {
	assert truncate('∅⊊ℕ⊊ℤ⊊ℚ⊊ℝ⊊ℂ') == '∅⊊ℕ⊊ℤ'
}

fn test_english_and_emoji_short() {
	assert truncate('Fly 🛫') == 'Fly 🛫'
}

fn test_emoji_short() {
	assert truncate('💇') == '💇'
}

fn test_emoji_long() {
	assert truncate('❄🌡🤧🤒🏥🕰😀') == '❄🌡🤧🤒🏥'
}

fn test_royal_flush() {
	assert truncate('🃎🂸🃅🃋🃍🃁🃊') == '🃎🂸🃅🃋🃍'
}
