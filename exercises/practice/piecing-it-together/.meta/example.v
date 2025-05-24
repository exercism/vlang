module main

import math

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
	mut solution := ?FullInformation(none)
	limit := 241

	for r in 2 .. limit {
		for c in 2 .. limit {
			p := r * c
			b := (r + c - 2) * 2
			i := p - b
			a := f64(c) / r
			f := match true {
				a < 1 { 'portrait' }
				a == 1 { 'square' }
				else { 'landscape' }
			}

			if pieces := puzzle.pieces {
				if pieces != p {
					continue
				}
			}

			if border := puzzle.border {
				if border != b {
					continue
				}
			}

			if inside := puzzle.inside {
				if inside != i {
					continue
				}
			}

			if rows := puzzle.rows {
				if rows != r {
					continue
				}
			}

			if columns := puzzle.columns {
				if columns != c {
					continue
				}
			}

			if aspect_ratio := puzzle.aspect_ratio {
				if math.abs(aspect_ratio - a) > 0.001 {
					continue
				}
			}

			if format := puzzle.format {
				if format != f {
					continue
				}
			}

			if _ := solution {
				return error('Insufficient data')
			}

			solution = FullInformation{
				pieces:       p
				border:       b
				inside:       i
				rows:         r
				columns:      c
				aspect_ratio: a
				format:       f
			}
		}
	}

	return solution or { return error('Contradictory data') }
}
