module main

import rand

// The Latin alphabet, in the order the cipher shifts through.
const alphabet = 'abcdefghijklmnopqrstuvwxyz'

// The number of letters in the Latin alphabet, and the size of a Vigenere key.
const alphabet_size = 26

// random_key returns a key made of `length` random lowercase Latin letters.
// The instructions ask for at least 100 letters when no key is supplied.
fn random_key(length int) string {
	return rand.string_from_set(alphabet, length)
}

// encode encrypts `text` with the Vigenere cipher.
//
// Every letter is shifted forward by the distance given by the matching letter
// of `key`, wrapping around the alphabet. The key repeats for as long as the
// text needs it, upper case letters keep their case, and every other character
// is copied unchanged.
//
// > returns the ciphertext
// > returns an error when `key` is empty
fn encode(text string, key string) !string {
	return rotate(text, key, 1)
}

// decode turns `text` back into plaintext with the same `key` that `encode`
// used.
//
// > returns the plaintext
// > returns an error when `key` is empty
fn decode(text string, key string) !string {
	return rotate(text, key, -1)
}

// rotate shifts every letter of `text` by the matching letter of `key`.
// `direction` is 1 to encode and -1 to decode.
fn rotate(text string, key string, direction int) !string {
	if key == '' {
		return error('the key must not be empty')
	}
	mut out := []u8{cap: text.len}
	for i, ch in text {
		if !is_letter(ch) {
			out << ch
			continue
		}
		// Adding the alphabet size first keeps the sum positive, so the
		// remainder below behaves the same for encoding and decoding.
		shift := int(key[i % key.len] - `a`) * direction
		rotated := (int(ch - `a`) + shift + alphabet_size) % alphabet_size
		out << if ch < `a` { u8(`A` + rotated) } else { u8(`a` + rotated) }
	}
	return out.bytestr()
}

// is_letter reports whether `ch` is a Latin letter of either case.
fn is_letter(ch u8) bool {
	return (ch >= `a` && ch <= `z`) || (ch >= `A` && ch <= `Z`)
}
