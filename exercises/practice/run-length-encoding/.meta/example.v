module main

fn encode(str string) string {
  // We populate `buffer` from the back.
  mut buffer := []u8{len: str.len}
  mut offset := str.len

  // Characters in `str` from `end` onwards have already been encoded.
  mut end := str.len

  for end > 0 {
    ch := str[end - 1]
    mut begin := end - 1
    for (begin > 0) && (str[begin - 1] == ch) {
      begin--
    }

    // Run-length encode the run from `begin` (inclusive) to `end` (exclusive)
    // of the character `ch`
    offset--
    buffer[offset] = ch
    mut number := end - begin
    if number > 1 {
      for number > 0 {
        offset--
        buffer[offset] = u8(`0` + (number % 10))
        number = number / 10
      }
    }

    end = begin
  }

  return buffer[offset..(str.len)].bytestr()
}

fn decode(str string) string {
  mut buffer := []u8{}
  mut number := 0
  for ch in str {
    if ch.is_digit() {
      number *= 10
      number += int(ch - `0`)
    } else {
      if number == 0 {
        buffer << ch
      } else {
        for number > 0 {
          buffer << ch
          number--
        }
      }
      number = 0
    }
  }
  return buffer.bytestr()
}
