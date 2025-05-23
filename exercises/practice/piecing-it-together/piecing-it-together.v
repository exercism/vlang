module main

struct PartialInformation {
	pieces       ?int
	border       ?int
	inside       ?int
	rows         ?int
	columns      ?int
	aspect_ratio ?f64
	format       ?string
}

struct FullInformation {
	pieces       int
	border       int
	inside       int
	rows         int
	columns      int
	aspect_ratio f64
	format       string
}

fn jigsaw_data(puzzle PartialInformation) !FullInformation {
	// Please implement the `jigsaw_data` function
}
