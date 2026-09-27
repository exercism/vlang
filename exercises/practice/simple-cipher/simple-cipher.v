module main

// random_key returns a key made of `length` random lowercase Latin letters.
// The instructions ask for at least 100 letters when no key is supplied. V's
// `rand` module draws such a key with `string_from_set`.
fn random_key(length int) string {
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
}

// decode turns `text` back into plaintext with the same `key` that `encode`
// used.
//
// > returns the plaintext
// > returns an error when `key` is empty
fn decode(text string, key string) !string {
}
