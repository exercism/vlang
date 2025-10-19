module main

import strconv

enum State {
	ready
	running
	stopped
}

struct Stopwatch {
mut:
	current_state State

	current  int
	previous []int
}

fn Stopwatch.new() Stopwatch {
	return Stopwatch{
		current_state: .ready
	}
}

fn (stopwatch Stopwatch) state() State {
	return stopwatch.current_state
}

fn (stopwatch Stopwatch) current_lap() string {
	return serialize(stopwatch.current)
}

fn (stopwatch Stopwatch) previous_laps() []string {
	return stopwatch.previous.map(serialize)
}

fn (stopwatch Stopwatch) total() string {
	mut total := stopwatch.current
	for entry in stopwatch.previous {
		total += entry
	}
	return serialize(total)
}

fn (mut stopwatch Stopwatch) start() ! {
	if stopwatch.current_state != .running {
		stopwatch.current_state = .running
	} else {
		return error('cannot start an already running stopwatch')
	}
}

fn (mut stopwatch Stopwatch) stop() ! {
	if stopwatch.current_state == .running {
		stopwatch.current_state = .stopped
	} else {
		return error('cannot stop a stopwatch that is not running')
	}
}

fn (mut stopwatch Stopwatch) reset() ! {
	if stopwatch.current_state == .stopped {
		stopwatch.current_state = .ready
		stopwatch.current = 0
		stopwatch.previous.clear()
	} else {
		return error('cannot reset a stopwatch that is not stopped')
	}
}

fn (mut stopwatch Stopwatch) advance_time(by string) {
	if stopwatch.current_state == .running {
		stopwatch.current += deserialize(by)
	}
}

fn (mut stopwatch Stopwatch) lap() ! {
	if stopwatch.current_state == .running {
		stopwatch.previous << stopwatch.current
		stopwatch.current = 0
	} else {
		return error('cannot lap a stopwatch that is not running')
	}
}

fn serialize(time int) string {
	hours := time / 3600
	minutes := time % 3600 / 60
	seconds := time % 60
	return '${hours:02}:${minutes:02}:${seconds:02}'
}

fn deserialize(time string) int {
	parts := time.split(':')
	hours := strconv.atoi(parts[0]) or { 0 }
	minutes := strconv.atoi(parts[1]) or { 0 }
	seconds := strconv.atoi(parts[2]) or { 0 }
	return 3600 * hours + 60 * minutes + seconds
}
