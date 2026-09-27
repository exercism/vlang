module main

import math

// A point on the plane that holds the crystal array.
struct Point {
	x f64
	y f64
}

// A single crystal. `angle` is how far the crystal bends a beam that hits it,
// in degrees: a positive value bends counter-clockwise, a negative one
// clockwise.
struct Prism {
	id    int
	pos   Point
	angle f64
}

// How far the beam may miss a crystal and still count it as a hit. The
// floating point scenarios round every coordinate to one decimal, so the beam
// is never exactly collinear with the crystal it is meant to reach. Anything
// tighter loses the path on the first step, anything looser starts hitting
// crystals that are clearly off the beam.
const collinear_tolerance = 0.1

// Upper bound on the number of crystals one beam may hit. It only exists so
// that a beam trapped between two crystals reports an error instead of hanging.
const max_beam_steps = 10000

// find_sequence traces a laser that starts at `start` heading in the direction
// of `start_angle` degrees and returns the ids of the crystals it hits, in the
// order the beam reaches them.
//
// A crystal is hit when it lies ahead on the beam and is the closest crystal
// there. The crystal the beam currently sits on is not hit again, so a beam
// that is turned around can come back to it.
//
// > returns the hit sequence, which is empty when the beam leaves at once
// > returns an error when the beam is trapped and never escapes
fn find_sequence(start Point, start_angle f64, prisms []Prism) ![]int {
	mut pos := start
	mut angle := start_angle
	mut sequence := []int{}

	for _ in 0 .. max_beam_steps {
		hit := next_hit(pos, direction(angle), prisms)
		if hit < 0 {
			return sequence
		}
		sequence << prisms[hit].id
		// Snap to the crystal's own coordinates so that rounding never makes
		// the beam drift away from the crystals it has already visited, and
		// keep the heading inside a single turn for the same reason.
		pos = prisms[hit].pos
		angle = math.fmod(angle + prisms[hit].angle, 360.0)
	}
	return error('the beam never escapes the crystal array')
}

// direction turns a heading in degrees into a unit vector. The heading is
// wrapped into a single turn first, so huge and negative headings stay exact.
fn direction(angle f64) Point {
	radians := math.fmod(angle, 360.0) * math.pi / 180.0
	return Point{
		x: math.cos(radians)
		y: math.sin(radians)
	}
}

// next_hit returns the index of the closest crystal lying on the ray that
// starts at `pos` and travels along `dir`, or -1 when the ray hits nothing.
fn next_hit(pos Point, dir Point, prisms []Prism) int {
	mut hit := -1
	mut nearest := 0.0
	for i, prism in prisms {
		dx := prism.pos.x - pos.x
		dy := prism.pos.y - pos.y
		// How far along the beam the crystal sits. It is negative for
		// crystals the beam has already passed, and zero for the crystal the
		// beam is standing on.
		along := dx * dir.x + dy * dir.y
		if along <= collinear_tolerance {
			continue
		}
		// Perpendicular distance between the beam and the crystal. It is the
		// length of the cross product, so it vanishes exactly when the two are
		// collinear.
		across := dx * dir.y - dy * dir.x
		if math.abs(across) > collinear_tolerance {
			continue
		}
		if hit < 0 || along < nearest || (along == nearest && prism.id < prisms[hit].id) {
			hit = i
			nearest = along
		}
	}
	return hit
}
