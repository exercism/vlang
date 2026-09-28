module main

// A Callback is called with the new value of a cell whenever the value of that
// cell in a new stable state differs from the value it had in the previous one.
type Callback = fn (int)

// A Compute derives the value of a compute cell from the values of the cells it
// depends on, given in the order those cells were registered.
type Compute = fn ([]int) int

// One cell of a reaction. An input cell only holds a value, a compute cell also
// holds the formula that derives that value from other cells.
struct Cell {
mut:
	name      string
	is_input  bool
	inputs    []string
	compute   ?Compute
	value     int
	callbacks map[string]Callback
}

// A Reaction is a set of named cells. Giving an input cell a new value makes
// every cell that depends on it follow along, so the reaction always ends up in
// a new stable state before a change is reported.
struct Reaction {
mut:
	cells map[string]Cell
}

// new_reaction returns a reaction that has no cells yet.
fn new_reaction() &Reaction {
}

// create_input adds an input cell called `name` that holds `initial_value`.
//
// > returns an error when a cell called `name` is there already
fn (mut r Reaction) create_input(name string, initial_value int) ! {
}

// create_compute adds a compute cell called `name`. Its value is `compute`
// applied to the values of `inputs`, in the order they are given, and it is
// calculated as soon as the cell is added so it holds a value right away.
//
// > returns an error when a cell called `name` is there already, or when one of
// > `inputs` is not a cell of this reaction
fn (mut r Reaction) create_compute(name string, inputs []string, compute Compute) ! {
}

// set_value gives the input cell called `name` a new value and lets the cells
// depending on it follow, so the reaction settles before this returns. The
// callbacks of the cells whose value really changed are called exactly once,
// with the value those cells hold in the new stable state.
//
// > returns an error when there is no cell called `name`, or when it is a
// > compute cell, whose value is derived rather than set
fn (mut r Reaction) set_value(name string, value int) ! {
}

// add_callback registers `callback` under `id` for the cell called `name`, so it
// is called with the new value of that cell whenever the value changes. A
// second callback under the same `id` replaces the first one.
//
// > returns an error when there is no cell called `name`
fn (mut r Reaction) add_callback(name string, id string, callback Callback) ! {
}

// remove_callback drops the callback registered under `id` for the cell called
// `name`. Removing an id that is not registered changes nothing.
//
// > returns an error when there is no cell called `name`
fn (mut r Reaction) remove_callback(name string, id string) ! {
}

// value returns the value the cell called `name` holds in the current stable
// state.
//
// > returns an error when there is no cell called `name`
fn (r &Reaction) value(name string) !int {
}
