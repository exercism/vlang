module main

// is_lowercase_letters reports whether `s` is a non-empty run of lowercase
// letters. This is the check behind the canonical `^[a-z]+$` match on the key.
fn is_lowercase_letters(s string) bool {
	if s == '' {
		return false
	}
	for ch in s {
		if ch < `a` || ch > `z` {
			return false
		}
	}
	return true
}

// --- Random key cipher ---
//
// The canonical data describes these results symbolically, in terms of a
// `cipher.key` it never spells out. Shifting a run of `a`s reproduces the key
// unchanged, so a freshly generated key stands in for it exactly.

fn test_random_key_cipher_can_encode() {
	plaintext := 'aaaaaaaaaa'
	key := random_key(100)
	// Canonical: cipher.key.substring(0, plaintext.length)
	assert encode(plaintext, key)! == key[..plaintext.len]
}

fn test_random_key_cipher_can_decode() {
	key := random_key(100)
	// Canonical: cipher.key.substring(0, expected.length)
	ciphertext := key[..'aaaaaaaaaa'.len]
	assert decode(ciphertext, key)! == 'aaaaaaaaaa'
}

fn test_random_key_cipher_is_reversible() {
	plaintext := 'abcdefghij'
	key := random_key(100)
	// Canonical: cipher.encode, i.e. whatever the cipher just produced.
	ciphertext := encode(plaintext, key)!
	assert decode(ciphertext, key)! == plaintext
}

fn test_random_key_cipher_key_is_made_only_of_lowercase_letters() {
	key := random_key(100)
	assert key.len == 100
	// Canonical: the key matches ^[a-z]+$
	assert is_lowercase_letters(key)
}

// --- Substitution cipher ---

fn test_substitution_cipher_can_encode() {
	assert encode('aaaaaaaaaa', 'abcdefghij')! == 'abcdefghij'
}

fn test_substitution_cipher_can_decode() {
	assert decode('abcdefghij', 'abcdefghij')! == 'aaaaaaaaaa'
}

fn test_substitution_cipher_is_reversible() {
	key := 'abcdefghij'
	// The intermediate ciphertext is pinned down too, so that a `decode` that
	// simply echoed its input could not pass this test.
	ciphertext := encode('abcdefghij', key)!
	assert ciphertext == 'acegikmoqs'
	assert decode(ciphertext, key)! == 'abcdefghij'
}

fn test_substitution_cipher_can_double_shift_encode() {
	assert encode('iamapandabear', 'iamapandabear')! == 'qayaeaagaciai'
}

fn test_substitution_cipher_can_wrap_on_encode() {
	assert encode('zzzzzzzzzz', 'abcdefghij')! == 'zabcdefghi'
}

fn test_substitution_cipher_can_wrap_on_decode() {
	assert decode('zabcdefghi', 'abcdefghij')! == 'zzzzzzzzzz'
}

fn test_substitution_cipher_can_encode_messages_longer_than_the_key() {
	assert encode('iamapandabear', 'abc')! == 'iboaqcnecbfcr'
}

fn test_substitution_cipher_can_decode_messages_longer_than_the_key() {
	assert decode('iboaqcnecbfcr', 'abc')! == 'iamapandabear'
}
