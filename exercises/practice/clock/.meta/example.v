module main

struct Clock {
mut:
	time int
}

fn new_clock(hour int, minute int) Clock {
	mut c := Clock{
		time: (hour * 60 + minute) % 1440
	}
	if c.time < 0 {
		c.time += 1440
	}

	return c
}

fn (mut c Clock) add_time(minute int) {
	c.time = (c.time + minute) % 1440
}

fn (mut c Clock) subtract_time(minute int) {
	c.time = (c.time - minute) % 1440
	if c.time < 0 {
		c.time += 1440
	}
}

fn (c Clock) string() string {
	return '${c.time / 60:02}:${c.time % 60:02}'
}
