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
	return &Reaction{
		cells: map[string]Cell{}
	}
}

// create_input adds an input cell called `name` that holds `initial_value`.
//
// > returns an error when a cell called `name` is there already
fn (mut r Reaction) create_input(name string, initial_value int) ! {
	if name in r.cells {
		return error('a cell called ${name} is there already')
	}
	r.cells[name] = Cell{
		name:      name
		is_input:  true
		value:     initial_value
		callbacks: map[string]Callback{}
	}
}

// create_compute adds a compute cell called `name`. Its value is `compute`
// applied to the values of `inputs`, in the order they are given, and it is
// calculated as soon as the cell is added so it holds a value right away.
//
// > returns an error when a cell called `name` is there already, or when one of
// > `inputs` is not a cell of this reaction
fn (mut r Reaction) create_compute(name string, inputs []string, compute Compute) ! {
	if name in r.cells {
		return error('a cell called ${name} is there already')
	}
	for input in inputs {
		if input !in r.cells {
			return error('there is no cell called ${input} to compute ${name} from')
		}
	}
	r.cells[name] = Cell{
		name:      name
		inputs:    inputs.clone()
		compute:   compute
		callbacks: map[string]Callback{}
	}
	r.settle() or { return err }
}

// set_value gives the input cell called `name` a new value and lets the cells
// depending on it follow, so the reaction settles before this returns. The
// callbacks of the cells whose value really changed are called exactly once,
// with the value those cells hold in the new stable state.
//
// > returns an error when there is no cell called `name`, or when it is a
// > compute cell, whose value is derived rather than set
fn (mut r Reaction) set_value(name string, value int) ! {
	mut cell := r.cells[name] or { return error('there is no cell called ${name}') }
	if !cell.is_input {
		return error('the value of the compute cell ${name} cannot be set')
	}
	before := r.snapshot()
	cell.value = value
	r.cells[name] = cell
	r.settle() or { return err }
	r.report(before)
}

// add_callback registers `callback` under `id` for the cell called `name`, so it
// is called with the new value of that cell whenever the value changes. A
// second callback under the same `id` replaces the first one.
//
// > returns an error when there is no cell called `name`
fn (mut r Reaction) add_callback(name string, id string, callback Callback) ! {
	mut cell := r.cells[name] or { return error('there is no cell called ${name}') }
	cell.callbacks[id] = callback
	r.cells[name] = cell
}

// remove_callback drops the callback registered under `id` for the cell called
// `name`. Removing an id that is not registered changes nothing.
//
// > returns an error when there is no cell called `name`
fn (mut r Reaction) remove_callback(name string, id string) ! {
	mut cell := r.cells[name] or { return error('there is no cell called ${name}') }
	cell.callbacks.delete(id)
	r.cells[name] = cell
}

// value returns the value the cell called `name` holds in the current stable
// state.
//
// > returns an error when there is no cell called `name`
fn (r &Reaction) value(name string) !int {
	cell := r.cells[name] or { return error('there is no cell called ${name}') }
	return cell.value
}

// snapshot returns the value every cell holds right now.
fn (r &Reaction) snapshot() map[string]int {
	mut values := map[string]int{}
	for name in r.cell_names() {
		values[name] = r.current_value(name)
	}
	return values
}

// report calls the callbacks of every cell whose value differs from the value it
// had in the snapshot `before`, and of no other cell. Each callback of a cell is
// called once, however many inputs of that cell changed.
fn (mut r Reaction) report(before map[string]int) {
	for name in r.cell_names() {
		mut cell := r.cells[name] or { continue }
		if cell.value == before[name] {
			continue
		}
		mut ids := cell.callbacks.keys()
		ids.sort()
		for id in ids {
			callback := cell.callbacks[id] or { continue }
			callback(cell.value)
		}
	}
}

// settle recalculates the compute cells until none of them changes any more.
// Cells that do not depend on each other in a cycle reach one single stable
// state, whatever order they are visited in, so repeating the pass until nothing
// moves is enough to find that state.
//
// > returns an error when the cells depend on each other in a cycle, which
// > leaves the reaction without a stable state
fn (mut r Reaction) settle() ! {
	names := r.cell_names()
	mut passes_left := names.len * names.len + 1
	for passes_left > 0 {
		mut changed := false
		for name in names {
			mut cell := r.cells[name] or { continue }
			if cell.is_input {
				continue
			}
			compute := cell.compute or {
				return error('the compute cell ${name} has no formula')
			}
			next := compute(r.input_values(cell.inputs))
			if next != cell.value {
				cell.value = next
				r.cells[name] = cell
				changed = true
			}
		}
		if !changed {
			return
		}
		passes_left--
	}
	return error('the cells of this reaction depend on each other in a cycle')
}

// input_values collects the value every named cell currently holds.
fn (r &Reaction) input_values(names []string) []int {
	mut values := []int{}
	for name in names {
		values << r.current_value(name)
	}
	return values
}

// current_value returns the value the named cell holds.
fn (r &Reaction) current_value(name string) int {
	cell := r.cells[name] or { Cell{} }
	return cell.value
}

// cell_names returns the names of every cell, sorted, so that the reaction
// always walks its cells in the same order.
fn (r &Reaction) cell_names() []string {
	mut names := r.cells.keys()
	names.sort()
	return names
}
