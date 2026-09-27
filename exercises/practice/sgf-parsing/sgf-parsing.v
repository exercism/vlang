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
}

// value returns the first value of the property `key`, or none when the node
// has no such property.
fn (n &Node) value(key string) ?string {
}

// parse parses an SGF encoded game tree and returns the root node of the tree.
//
// An SGF game tree is `(` followed by nodes and ended by `)`. A node is `;`
// followed by properties, and every property is an uppercase identifier
// followed by at least one value in square brackets. The variations of a node
// follow it, each of them in parentheses of their own.
//
// Property values are SGF Text: a backslash escapes the character behind it (a
// newline behind a backslash disappears), every other whitespace character
// becomes a space and a newline stays a newline.
//
// > returns an error when `encoded` is not a well formed SGF game tree
fn parse(encoded string) !Node {
}
