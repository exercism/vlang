module main

// A node of an SGF game tree: the properties describing the position that the
// node stands for, plus the variations that continue from that position.
struct Node {
mut:
	// Every property of the node, mapped from its identifier to its values.
	// A key occurs at most once, but it can have several values.
	properties map[string][]string
	// The variations that follow this node, in the order they were written.
	children []Node
}

// values returns every value of the property `key`, or an empty array when the
// node has no such property.
fn (n &Node) values(key string) []string {
	return n.properties[key] or { []string{} }
}

// value returns the first value of the property `key`, or none when the node
// has no such property.
fn (n &Node) value(key string) ?string {
	values := n.values(key)
	if values.len == 0 {
		return none
	}
	return values[0]
}

// parse parses an SGF encoded game tree and returns the root node of the tree.
// > returns an error when `encoded` is not a well formed SGF game tree
fn parse(encoded string) !Node {
	mut parser := Parser{
		input: encoded
	}
	if !parser.at(`(`) {
		return error('tree missing')
	}
	// A collection is never empty, so the tree always has a root node.
	return parser.parse_collection()![0]
}

// A cursor over the encoded SGF text.
struct Parser {
mut:
	input string
	pos   int
}

// at reports whether the next character of the input is `c`.
fn (p &Parser) at(c u8) bool {
	return p.has_more() && p.input[p.pos] == c
}

// has_more reports whether there is input left to read.
fn (p &Parser) has_more() bool {
	return p.pos < p.input.len
}

// peek returns the next character of the input without reading it.
// < invariant p.has_more()
fn (p &Parser) peek() u8 {
	return p.input[p.pos]
}

// next reads and returns the next character of the input.
// < invariant p.has_more()
fn (mut p Parser) next() u8 {
	c := p.input[p.pos]
	p.pos++
	return c
}

// expect reads the next character of the input and fails when it is not `c`.
// > returns an error when the next character is missing or is not `c`
fn (mut p Parser) expect(c u8) ! {
	if !p.at(c) {
		return error('expected ${c}')
	}
	p.pos++
}

// parse_collection reads `(` <nodes> `)` and returns the tree they describe.
// A sequence of nodes is a shorthand for a chain of single children, so
// `(;A;B)` is read as a node `A` with a single child `B`.
//
// > returns 'tree with no nodes' when the collection holds no node, and an
// > error when the input is not a well formed collection
fn (mut p Parser) parse_collection() ![]Node {
	p.expect(`(`)!
	mut nodes := []Node{}
	for p.has_more() && p.at(`;`) {
		nodes << p.parse_node()!
	}
	if nodes.len == 0 {
		p.expect(`)`)!
		return error('tree with no nodes')
	}
	// The variations of a collection continue from its last node.
	for p.at(`(`) {
		variation := p.parse_collection()!
		nodes[nodes.len - 1].children << variation[0]
	}
	p.expect(`)`)!
	for index in 0 .. nodes.len - 1 {
		nodes[index].children << nodes[index + 1]
	}
	return nodes
}

// parse_node reads `;` <properties> and returns the node they describe.
// > returns an error when a property is malformed
fn (mut p Parser) parse_node() !Node {
	p.expect(`;`)!
	mut node := Node{
		properties: map[string][]string{}
	}
	for p.has_more() && p.peek().is_letter() {
		key := p.parse_key()!
		mut values := []string{}
		for p.at(`[`) {
			values << p.parse_value()!
		}
		if values.len == 0 {
			return error('properties without delimiter')
		}
		node.properties[key] = values
	}
	return node
}

// parse_key reads the identifier of a property.
// > returns 'property must be in uppercase' when the identifier holds anything
// > other than capital letters
fn (mut p Parser) parse_key() !string {
	mut key := []u8{}
	for p.has_more() && p.peek().is_letter() {
		letter := p.next()
		if !letter.is_capital() {
			return error('property must be in uppercase')
		}
		key << letter
	}
	return key.bytestr()
}

// parse_value reads `[` <text> `]` and returns the text as it is stored, after
// the escape and whitespace rules of the SGF Text type have been applied.
// > returns an error when the value is left open
fn (mut p Parser) parse_value() !string {
	p.expect(`[`)!
	mut value := []u8{}
	for {
		if !p.has_more() {
			return error('property value left open')
		}
		c := p.next()
		if c == `]` {
			break
		}
		if c == `\\` {
			// A backslash escapes the character behind it: a newline
			// disappears, anything else is inserted as it is.
			if !p.has_more() {
				return error('property value left open')
			}
			escaped := p.next()
			if escaped != `\n` {
				value << insert(escaped)
			}
			continue
		}
		value << insert(c)
	}
	return value.bytestr()
}

// insert returns the character as a property value stores it: whitespace
// becomes a space, a newline stays a newline and every other character is
// inserted as it is.
fn insert(c u8) u8 {
	if c == `\n` {
		return c
	}
	if c.is_space() {
		return ` `
	}
	return c
}
