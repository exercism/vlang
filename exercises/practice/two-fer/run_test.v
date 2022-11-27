module main

fn test_no_name() {
	assert two_fer('') == 'One for you, one for me.'
}

fn test_alice() {
	assert two_fer('Alice') == 'One for Alice, one for me.'
}

fn test_bob() {
	assert two_fer('Bob') == 'One for Bob, one for me.'
}
