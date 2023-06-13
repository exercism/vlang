module main

fn test_basic() {
	phrase := 'Portable Network Graphics'
	assert abbreviate(phrase) == 'PNG'
}

fn test_lowercase_words() {
	phrase := 'Ruby on Rails'
	assert abbreviate(phrase) == 'ROR'
}

fn test_punctuation() {
	phrase := 'First In, First Out'
	assert abbreviate(phrase) == 'FIFO'
}

fn test_all_caps_word() {
	phrase := 'GNU Image Manipulation Program'
	assert abbreviate(phrase) == 'GIMP'
}

fn test_punctuation_without_whitespace() {
	phrase := 'Complementary metal-oxide semiconductor'
	assert abbreviate(phrase) == 'CMOS'
}

fn test_very_long_abbreviation() {
	phrase := 'Rolling On The Floor Laughing So Hard That My Dogs Came Over And Licked Me'
	assert abbreviate(phrase) == 'ROTFLSHTMDCOALM'
}

fn test_consecutive_delimiters() {
	phrase := 'Something - I made up from thin air'
	assert abbreviate(phrase) == 'SIMUFTA'
}

fn test_apostrophes() {
	phrase := "Halley's Comet"
	assert abbreviate(phrase) == 'HC'
}

fn test_underscore_emphasis() {
	phrase := 'The Road _Not_ Taken'
	assert abbreviate(phrase) == 'TRNT'
}
