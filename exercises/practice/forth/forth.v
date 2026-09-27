module main

// The words that are built in. Words are case insensitive, so a word is lower
// cased before it is looked up here or in `Machine.definitions`.
const builtins = ['+', '-', '*', '/', 'dup', 'drop', 'swap', 'over']!

// A Forth machine: the data stack, plus every word that has been defined on it.
//
// A definition is kept already broken down into numbers and built in words.
// That way a word keeps working against the definition it was written against,
// even when a word it was built from is defined again later on: with
// `: bar foo ;`, defining `foo` again does not change what `bar` does.
struct Machine {
mut:
	stack       []int
	definitions map[string][]string
}

// new_machine returns a machine with an empty stack and no definitions.
fn new_machine() &Machine {
}

// run evaluates one line of Forth source. A line may define words with
// `: name ... ;` and use them; those definitions stay in force for the lines
// that follow on the same machine.
//
// > returns an error for a definition that has no name or is never closed, for
// > a word that does not exist, for a definition of a number, for a word that
// > needs more values than the stack holds and for a division by zero
fn (mut m Machine) run(source string) ! {
}

// pop removes the value on top of the stack and returns it.
//
// > returns an error when the stack is empty
fn (mut m Machine) pop() !int {
}

// stack_values returns the values on the stack, the value that was pushed
// first first.
fn (m &Machine) stack_values() []int {
}
