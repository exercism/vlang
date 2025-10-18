module main

enum State {
	// Please define the `State` enum
}

struct Stopwatch {
	// Please define the `Stopwatch` struct
}

fn Stopwatch.new() Stopwatch {
	// Please implement the `Stopwatch.new` function
}

fn (stopwatch Stopwatch) state() State {
	// Please implement the `state` function
}

fn (stopwatch Stopwatch) current_lap() string {
	// Please implement the `current_lap` function
}

fn (stopwatch Stopwatch) previous_laps() []string {
	// Please implement the `previous_laps` function
}

fn (stopwatch Stopwatch) total() string {
	// Please implement the `total` function
}

fn (mut stopwatch Stopwatch) start() ! {
	// Please implement the `start` function
}

fn (mut stopwatch Stopwatch) stop() ! {
	// Please implement the `stop` function
}

fn (mut stopwatch Stopwatch) reset() ! {
	// Please implement the `reset` function
}

fn (mut stopwatch Stopwatch) advance_time(by string) {
	// Please implement the `advance_time` function
}

fn (mut stopwatch Stopwatch) lap() ! {
	// Please implement the `lap` function
}
