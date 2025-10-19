module main

fn test_new_stopwatch_starts_in_ready_state() {
	mut stopwatch := Stopwatch.new()
	assert stopwatch.state() == State.ready
}

fn test_new_stopwatchs_current_lap_has_no_elapsed_time() {
	mut stopwatch := Stopwatch.new()
	assert stopwatch.current_lap() == '00:00:00'
}

fn test_new_stopwatchs_total_has_no_elapsed_time() {
	mut stopwatch := Stopwatch.new()
	assert stopwatch.total() == '00:00:00'
}

fn test_new_stopwatch_does_not_have_previous_laps() {
	mut stopwatch := Stopwatch.new()
	assert stopwatch.previous_laps() == []string{}
}

fn test_start_from_ready_state_changes_state_to_running() {
	mut stopwatch := Stopwatch.new()
	stopwatch.start()!
	assert stopwatch.state() == State.running
}

fn test_start_does_not_change_previous_laps() {
	mut stopwatch := Stopwatch.new()
	stopwatch.start()!
	assert stopwatch.previous_laps() == []string{}
}

fn test_start_initiates_time_tracking_for_current_lap() {
	mut stopwatch := Stopwatch.new()
	stopwatch.start()!
	stopwatch.advance_time('00:00:05')
	assert stopwatch.current_lap() == '00:00:05'
}

fn test_start_initiates_time_tracking_for_total() {
	mut stopwatch := Stopwatch.new()
	stopwatch.start()!
	stopwatch.advance_time('00:00:23')
	assert stopwatch.total() == '00:00:23'
}

fn test_start_cannot_be_called_from_running_state() {
	mut stopwatch := Stopwatch.new()
	stopwatch.start()!
	if _ := stopwatch.start() {
		assert false, 'start() should return an error'
	} else {
		assert err.msg() == 'cannot start an already running stopwatch'
	}
}

fn test_stop_from_running_state_changes_state_to_stopped() {
	mut stopwatch := Stopwatch.new()
	stopwatch.start()!
	stopwatch.stop()!
	assert stopwatch.state() == State.stopped
}

fn test_stop_pauses_time_tracking_for_current_lap() {
	mut stopwatch := Stopwatch.new()
	stopwatch.start()!
	stopwatch.advance_time('00:00:05')
	stopwatch.stop()!
	stopwatch.advance_time('00:00:08')
	assert stopwatch.current_lap() == '00:00:05'
}

fn test_stop_pauses_time_tracking_for_total() {
	mut stopwatch := Stopwatch.new()
	stopwatch.start()!
	stopwatch.advance_time('00:00:13')
	stopwatch.stop()!
	stopwatch.advance_time('00:00:44')
	assert stopwatch.total() == '00:00:13'
}

fn test_stop_cannot_be_called_from_ready_state() {
	mut stopwatch := Stopwatch.new()
	if _ := stopwatch.stop() {
		assert false, 'stop() should return an error'
	} else {
		assert err.msg() == 'cannot stop a stopwatch that is not running'
	}
}

fn test_stop_cannot_be_called_from_stopped_state() {
	mut stopwatch := Stopwatch.new()
	stopwatch.start()!
	stopwatch.stop()!
	if _ := stopwatch.stop() {
		assert false, 'stop() should return an error'
	} else {
		assert err.msg() == 'cannot stop a stopwatch that is not running'
	}
}

fn test_start_from_stopped_state_changes_state_to_running() {
	mut stopwatch := Stopwatch.new()
	stopwatch.start()!
	stopwatch.stop()!
	stopwatch.start()!
	assert stopwatch.state() == State.running
}

fn test_start_from_stopped_state_resumes_time_tracking_for_current_lap() {
	mut stopwatch := Stopwatch.new()
	stopwatch.start()!
	stopwatch.advance_time('00:01:20')
	stopwatch.stop()!
	stopwatch.advance_time('00:00:20')
	stopwatch.start()!
	stopwatch.advance_time('00:00:08')
	assert stopwatch.current_lap() == '00:01:28'
}

fn test_start_from_stopped_state_resumes_time_tracking_for_total() {
	mut stopwatch := Stopwatch.new()
	stopwatch.start()!
	stopwatch.advance_time('00:00:23')
	stopwatch.stop()!
	stopwatch.advance_time('00:00:44')
	stopwatch.start()!
	stopwatch.advance_time('00:00:09')
	assert stopwatch.total() == '00:00:32'
}

fn test_lap_adds_current_lap_to_previous_laps() {
	mut stopwatch := Stopwatch.new()
	stopwatch.start()!
	stopwatch.advance_time('00:01:38')
	stopwatch.lap()!
	assert stopwatch.previous_laps() == ['00:01:38']
	stopwatch.advance_time('00:00:44')
	stopwatch.lap()!
	assert stopwatch.previous_laps() == ['00:01:38', '00:00:44']
}

fn test_lap_resets_current_lap_and_resumes_time_tracking() {
	mut stopwatch := Stopwatch.new()
	stopwatch.start()!
	stopwatch.advance_time('00:08:22')
	stopwatch.lap()!
	assert stopwatch.current_lap() == '00:00:00'
	stopwatch.advance_time('00:00:15')
	assert stopwatch.current_lap() == '00:00:15'
}

fn test_lap_continues_time_tracking_for_total() {
	mut stopwatch := Stopwatch.new()
	stopwatch.start()!
	stopwatch.advance_time('00:00:22')
	stopwatch.lap()!
	stopwatch.advance_time('00:00:33')
	assert stopwatch.total() == '00:00:55'
}

fn test_lap_cannot_be_called_from_ready_state() {
	mut stopwatch := Stopwatch.new()
	if _ := stopwatch.lap() {
		assert false, 'lap() should return an error'
	} else {
		assert err.msg() == 'cannot lap a stopwatch that is not running'
	}
}

fn test_lap_cannot_be_called_from_stopped_state() {
	mut stopwatch := Stopwatch.new()
	stopwatch.start()!
	stopwatch.stop()!
	if _ := stopwatch.lap() {
		assert false, 'lap() should return an error'
	} else {
		assert err.msg() == 'cannot lap a stopwatch that is not running'
	}
}

fn test_stop_does_not_change_previous_laps() {
	mut stopwatch := Stopwatch.new()
	stopwatch.start()!
	stopwatch.advance_time('00:11:22')
	stopwatch.lap()!
	assert stopwatch.previous_laps() == ['00:11:22']
	stopwatch.stop()!
	assert stopwatch.previous_laps() == ['00:11:22']
}

fn test_reset_from_stopped_state_changes_state_to_ready() {
	mut stopwatch := Stopwatch.new()
	stopwatch.start()!
	stopwatch.stop()!
	stopwatch.reset()!
	assert stopwatch.state() == State.ready
}

fn test_reset_resets_current_lap() {
	mut stopwatch := Stopwatch.new()
	stopwatch.start()!
	stopwatch.advance_time('00:00:10')
	stopwatch.stop()!
	stopwatch.reset()!
	assert stopwatch.current_lap() == '00:00:00'
}

fn test_reset_clears_previous_laps() {
	mut stopwatch := Stopwatch.new()
	stopwatch.start()!
	stopwatch.advance_time('00:00:10')
	stopwatch.lap()!
	stopwatch.advance_time('00:00:20')
	stopwatch.lap()!
	assert stopwatch.previous_laps() == ['00:00:10', '00:00:20']
	stopwatch.stop()!
	stopwatch.reset()!
	assert stopwatch.previous_laps() == []string{}
}

fn test_reset_cannot_be_called_from_ready_state() {
	mut stopwatch := Stopwatch.new()
	if _ := stopwatch.reset() {
		assert false, 'reset() should return an error'
	} else {
		assert err.msg() == 'cannot reset a stopwatch that is not stopped'
	}
}

fn test_reset_cannot_be_called_from_running_state() {
	mut stopwatch := Stopwatch.new()
	stopwatch.start()!
	if _ := stopwatch.reset() {
		assert false, 'reset() should return an error'
	} else {
		assert err.msg() == 'cannot reset a stopwatch that is not stopped'
	}
}

fn test_supports_very_long_laps() {
	mut stopwatch := Stopwatch.new()
	stopwatch.start()!
	stopwatch.advance_time('01:23:45')
	assert stopwatch.current_lap() == '01:23:45'
	stopwatch.lap()!
	assert stopwatch.previous_laps() == ['01:23:45']
	stopwatch.advance_time('04:01:40')
	assert stopwatch.current_lap() == '04:01:40'
	assert stopwatch.total() == '05:25:25'
	stopwatch.lap()!
	assert stopwatch.previous_laps() == ['01:23:45', '04:01:40']
	stopwatch.advance_time('08:43:05')
	assert stopwatch.current_lap() == '08:43:05'
	assert stopwatch.total() == '14:08:30'
	stopwatch.lap()!
	assert stopwatch.previous_laps() == ['01:23:45', '04:01:40', '08:43:05']
}
