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
	return &Machine{
		stack:       []int{}
		definitions: map[string][]string{}
	}
}

// run evaluates one line of Forth source. A line may define words with
// `: name ... ;` and use them; those definitions stay in force for the lines
// that follow on the same machine.
//
// > returns an error for a definition that has no name or is never closed, for
// > a word that does not exist, for a definition of a number, for a word that
// > needs more values than the stack holds and for a division by zero
fn (mut m Machine) run(source string) ! {
	words := source.fields()
	mut i := 0
	for i < words.len {
		if words[i] == ':' {
			i = m.define(words, i + 1)!
			continue
		}
		m.execute(words[i]) or { return err }
		i++
	}
}

// pop removes the value on top of the stack and returns it.
//
// > returns an error when the stack is empty
fn (mut m Machine) pop() !int {
	if m.stack.len == 0 {
		return error('empty stack')
	}
	return m.stack.pop()
}

// stack_values returns the values on the stack, the value that was pushed
// first first.
fn (m &Machine) stack_values() []int {
	return m.stack.clone()
}

// define reads the definition whose name sits at `at`, which is the word right
// after the `:`, and returns the position of the word after the closing `;`.
//
// > returns an error when the definition has no name, is never closed, or uses
// > a word that does not exist
fn (mut m Machine) define(words []string, at int) !int {
	if at >= words.len {
		return error('illegal operation: a definition needs a name')
	}
	if is_number(words[at]) {
		return error('illegal operation: ${words[at]} is a number, not a word')
	}
	name := words[at].to_lower()
	mut body := []string{}
	mut i := at + 1
	for i < words.len {
		if words[i] == ';' {
			m.definitions[name] = body
			return i + 1
		}
		word := words[i].to_lower()
		if is_number(words[i]) || word in builtins {
			body << word
		} else {
			// A word defined earlier stands for the body it was given, so
			// this definition keeps running against that body.
			primitives := m.definitions[word] or {
				return error('undefined operation: ${words[i]}')
			}
			body << primitives
		}
		i++
	}
	return error('illegal operation: the definition of ${name} is never closed')
}

// execute runs a single word.
fn (mut m Machine) execute(word string) ! {
	if is_number(word) {
		m.stack << word.int()
		return
	}
	// A word defined on this machine shadows the built in word of that name.
	// Definitions hold numbers and built in words only, because their bodies
	// were expanded when they were defined, so this cannot recurse.
	lower := word.to_lower()
	if lower in m.definitions {
		for step in m.definitions[lower] {
			m.execute(step) or { return err }
		}
		return
	}
	match lower {
		'+' {
			a, b := m.operands()!
			m.stack << a + b
		}
		'-' {
			a, b := m.operands()!
			m.stack << a - b
		}
		'*' {
			a, b := m.operands()!
			m.stack << a * b
		}
		'/' {
			a, b := m.operands()!
			if b == 0 {
				return error('divide by zero')
			}
			m.stack << a / b
		}
		'dup' {
			if m.stack.len == 0 {
				return error('empty stack')
			}
			m.stack << m.stack[m.stack.len - 1]
		}
		'drop' {
			m.pop() or { return err }
		}
		'swap' {
			a, b := m.operands()!
			m.stack << b
			m.stack << a
		}
		'over' {
			if m.stack.len < 2 {
				return error(m.underflow_reason())
			}
			m.stack << m.stack[m.stack.len - 2]
		}
		else {
			return error('undefined operation: ${word}')
		}
	}
}

// operands removes the two values a word works on and returns them, the one
// that was pushed first first.
//
// > returns an error when the stack holds fewer than two values
fn (mut m Machine) operands() !(int, int) {
	if m.stack.len < 2 {
		return error(m.underflow_reason())
	}
	b := m.stack[m.stack.len - 1]
	a := m.stack[m.stack.len - 2]
	m.stack = m.stack[..m.stack.len - 2]
	return a, b
}

// underflow_reason says why a word could not get the two values it needs. The
// stack is too short either way, so the only question is how short it is.
fn (m &Machine) underflow_reason() string {
	if m.stack.len == 0 {
		return 'empty stack'
	}
	return 'only one value on the stack'
}

// is_number reports whether a word is a number: an optional leading minus sign
// followed by one or more digits. Anything else is a word.
fn is_number(word string) bool {
	mut digits := word
	if digits.starts_with('-') {
		digits = digits[1..]
	}
	if digits.len == 0 {
		return false
	}
	for digit in digits {
		if digit < `0` || digit > `9` {
			return false
		}
	}
	return true
}
