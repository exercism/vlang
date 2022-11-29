module main

fn two_fer(name string) string {
	if name == '' {
		return 'One for you, one for me.'
	}
	return 'One for ${name}, one for me.'
}
