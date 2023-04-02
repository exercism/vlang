module main

import time

fn add_gigasecond(t time.Time) time.Time {
	return t.add_seconds(1000000000)
}
