module main

fn columns(n int) int {
	mut c := 0
	for c * c < n {
		c += 1
	}
	return c
}

fn rows(n int, c int) int {
	mut r := c - 1
	if r * c < n {
		r += 1
	}
	assert r * c >= n
	return r
}

fn ciphertext(plaintext string) string {
	mut normalized := []u8{cap: plaintext.len}
	for ch in plaintext.to_lower() {
		if ch.is_alnum() {
			normalized << ch
		}
	}

	n := normalized.len
	if n <= 1 {
		return normalized.bytestr()
	}
	c := columns(n)
	r := rows(n, c)

	mut buffer := []u8{len: (r + 1) * c - 1, init: u8(` `)}
	mut index := 0
	for i in 0 .. r {
		for j in 0 .. c {
			buffer[j * (r + 1) + i] = normalized[index]
			index += 1
			if index == n {
				break
			}
		}
	}
	return buffer.bytestr()
}
