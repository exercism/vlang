module main

// The markdown subset that `parse` understands.
const header_prefix = '#'
const list_prefix = '* '
const max_header_level = 6
const em_delimiter = '_'
const strong_delimiter = '__'
const text_tag = 'text'

// parse parses a markdown document into the tags and the text of its elements
// in document order, depth first.
//
// A line that starts with one to six `#` followed by a space becomes a header,
// a line that starts with `* ` becomes an item of the list it is part of and
// every other line becomes a paragraph. Blank lines are ignored.
//
// Every element adds its own tag to the result. An element without nested
// elements adds its text behind its tag, an element with nested elements adds
// the tags and the text of those instead. Text that sits between nested
// elements is added as a run of text behind the tag 'text'.
fn parse(md string) []string {
	mut tokens := []string{}
	mut items := []string{}
	for line in md.split('\n') {
		if line.trim_space() == '' {
			continue
		}
		if line.starts_with(list_prefix) {
			items << element('li', line[list_prefix.len..])
			continue
		}
		if items.len > 0 {
			tokens << 'ul'
			tokens << items
			items = []string{}
		}
		tokens << block_from_line(line)
	}
	if items.len > 0 {
		tokens << 'ul'
		tokens << items
	}
	return tokens
}

// block_from_line returns the tags and the text of a line that is not a list
// item: a header when the line starts with one to six `#`, a paragraph
// otherwise.
fn block_from_line(line string) []string {
	mut rest := line
	mut level := 0
	for rest.starts_with(header_prefix) {
		level++
		rest = rest[1..]
	}
	if level == 0 || level > max_header_level || !rest.starts_with(' ') {
		return element('p', line)
	}
	return element('h${level}', rest[1..])
}

// element returns the tag `tag` together with the inline elements of `text`.
//
// Text without emphasis is added as it is, text with emphasis is added as its
// runs of plain text and its `em` and `strong` elements.
fn element(tag string, text string) []string {
	mut tokens := [
		tag,
	]
	inline := parse_inline(text)
	if inline.len == 0 {
		tokens << text
	} else {
		tokens << inline
	}
	return tokens
}

// parse_inline returns the inline elements of `text` in the order they appear:
// the runs of plain text and the `em` and `strong` elements. Text without any
// emphasis has no inline elements, it belongs behind the tag of the element
// that holds it.
fn parse_inline(text string) []string {
	mut tokens := []string{}
	mut plain := ''
	mut rest := text
	mut emphasised := false
	for {
		open := rest.index(em_delimiter) or { -1 }
		if open < 0 {
			plain += rest
			break
		}
		mut delimiter := em_delimiter
		if rest[open + 1..].starts_with(em_delimiter) {
			delimiter = strong_delimiter
		}
		body := rest[open + delimiter.len..]
		close := body.index(delimiter) or { -1 }
		if close < 0 {
			plain += rest
			break
		}
		plain += rest[..open]
		if plain != '' {
			tokens << text_tag
			tokens << plain
			plain = ''
		}
		tokens << if delimiter == strong_delimiter { 'strong' } else { 'em' }
		tokens << body[..close]
		emphasised = true
		rest = body[close + delimiter.len..]
	}
	if emphasised && plain != '' {
		tokens << text_tag
		tokens << plain
	}
	return tokens
}
