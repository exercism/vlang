module main

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
//
// TODO: all of the work happens in this one function: the lines are walked
// TODO: through, the header level is counted, the list is kept open, the
// TODO: emphasis is looked for in the text and the tags and the text are put
// TODO: together. Split it into small functions that each do one step and
// TODO: name them after the step they do.
fn parse(md string) []string {
	mut result := []string{}
	mut list := []string{}
	mut list_open := false
	mut lines := md.split('\n')
	for line in lines {
		if line.trim_space() != '' {
			mut tag := ''
			mut text := line
			mut level := 0
			mut i := 0
			// TODO: the header level is counted with a hand written loop and
			// TODO: the deepest header there is, 6, is written down here as a
			// TODO: number. Let a helper of its own answer the question "which
			// TODO: header is this line?" and give the limit a name.
			for i < line.len && line[i] == `#` {
				level++
				i++
			}
			if i > 0 && i < 7 && i < line.len && line[i] == ` ` {
				tag = 'h' + level.str()
				text = line[i + 1..]
			}
			// TODO: the line is taken apart twice, first for the header check
			// TODO: and then again here for the list marker, whose two
			// TODO: characters are cut off with the number 2. Let one place
			// TODO: decide what a line is and hand that decision to the rest
			// TODO: of the function.
			if line.starts_with('* ') {
				tag = 'li'
				text = line[2..]
			}
			if tag == '' {
				tag = 'p'
			}
			mut element := []string{}
			element << tag
			// TODO: the emphasis is found by walking over the text one
			// TODO: character at a time, once looking for the opening
			// TODO: delimiter and once for the closing one, and the delimiters
			// TODO: are written out again and again in the middle of the
			// TODO: loop. `String.index` already knows where a delimiter is,
			// TODO: and two named delimiters beat '_' and '__' here.
			mut plain := ''
			mut rest := text
			mut emphasised := false
			for rest.len > 0 {
				mut open := -1
				mut j := 0
				for j < rest.len {
					if rest[j] == `_` {
						open = j
						break
					}
					j++
				}
				if open < 0 {
					plain += rest
					break
				}
				mut delimiter := '_'
				if rest[open + 1..].starts_with('_') {
					delimiter = '__'
				}
				body := rest[open + delimiter.len..]
				mut close := -1
				mut k := 0
				for k < body.len {
					if body[k] == delimiter[0] {
						close = k
						break
					}
					k++
				}
				if close < 0 {
					plain += rest
					break
				}
				plain += rest[..open]
				if plain.len > 0 {
					element << 'text'
					element << plain
					plain = ''
				}
				if delimiter == '__' {
					element << 'strong'
				} else {
					element << 'em'
				}
				element << body[..close]
				emphasised = true
				rest = body[close + delimiter.len..]
			}
			// TODO: whether the text is plain or not is decided twice, at the
			// TODO: end of the scan above and right here. Let the scan hand
			// TODO: back the runs it found and make that decision once.
			if emphasised && plain.len > 0 {
				element << 'text'
				element << plain
			}
			if !emphasised {
				element << text
			}
			if tag == 'li' {
				list << element
				list_open = true
			} else {
				// TODO: closing the list is written down here and once more
				// TODO: after the loop, and that is the only reason the extra
				// TODO: `list_open` flag is needed. Find a way to close a list
				// TODO: in a single place.
				if list_open {
					result << 'ul'
					result << list
					list = []string{}
					list_open = false
				}
				result << element
			}
		}
	}
	if list_open {
		result << 'ul'
		result << list
	}
	return result
}
