module main

enum Command as u8 {
	wink
	double_blink
	close_your_eyes
	jump
	reverse
}

const code_to_command_map = {
	0b00001: Command.wink
	0b00010: Command.double_blink
	0b00100: Command.close_your_eyes
	0b01000: Command.jump
	0b10000: Command.reverse
}

pub fn commands(encoded_message int) []Command {
	mut commands := []Command{}

	for code, command in code_to_command_map {
		if should_apply_command(encoded_message, code) {
			commands = apply_command(commands, command)
		}
	}

	return commands
}

fn should_apply_command(encoded_message int, command_code int) bool {
	return encoded_message & command_code == command_code
}

fn apply_command(commands []Command, command Command) []Command {
	if command == .reverse {
		return commands.reverse()
	}

	mut new_commands := commands.clone()

	new_commands << command

	return new_commands
}
