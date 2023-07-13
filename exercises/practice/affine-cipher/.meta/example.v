module main

import math

struct Key {
	a int
	b int
}

// Returns a non-negative value, even if a is negative.
fn mod(a int, b int) int {
	assert 0 < b
	r := a % b
	return if 0 <= r { r } else { b + r }
}

// modular multiplicative inverse
fn mmi(a int, m int) int {
	_, _, y := math.egcd(m, a)
	return int(y)
}

fn encode(phrase string, key Key) !string {
	if key.a == 0 || math.gcd(26, key.a) != 1 {
		return error('a and m must be coprime.')
	}
	mut buffer := []u8{cap: phrase.len * 6 / 5}
	for ch in phrase {
		if !ch.is_alnum() {
			continue
		}
		if buffer.len % 6 == 5 {
			buffer << u8(` `)
		}
		if ch.is_digit() {
			buffer << ch
			continue
		}
		i := if ch >= `a` { int(ch - `a`) } else { int(ch - `A`) }
		assert 0 <= i && i < 26
		j := mod(key.a * i + key.b, 26)
		buffer << u8(`a` + j)
	}
	return buffer.bytestr()
}

fn decode(phrase string, key Key) !string {
	if key.a == 0 || math.gcd(26, key.a) != 1 {
		return error('a and m must be coprime.')
	}
	a_inverse := mmi(key.a, 26)
	assert mod(a_inverse * key.a, 26) == 1
	mut buffer := []u8{cap: phrase.len}
	for ch in phrase {
		if !ch.is_alnum() {
			continue
		}
		if ch.is_digit() {
			buffer << ch
			continue
		}
		j := int(ch - `a`)
		assert 0 <= j && j < 26
		i := mod(a_inverse * (j - key.b), 26)
		buffer << u8(`a` + i)
	}
	return buffer.bytestr()
}
