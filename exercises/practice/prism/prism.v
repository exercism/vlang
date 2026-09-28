module main

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

// find_sequence traces a laser that starts at `start` heading in the direction
// of `start_angle` degrees and returns the ids of the crystals it hits, in the
// order the beam reaches them.
//
// A crystal is hit when it lies ahead on the beam and is the closest crystal
// there. The crystal the beam currently sits on is not hit again, so a beam
// that is turned around can come back to it later.
//
// The canonical data rounds coordinates to one decimal place, so the beam is
// never exactly collinear with the crystal it is meant to reach. Compare with a
// small tolerance rather than for exact equality.
//
// > returns the hit sequence, which is empty when the beam leaves at once
// > returns an error when the beam is trapped and never escapes
fn find_sequence(start Point, start_angle f64, prisms []Prism) ![]int {
}
