module main

fn encode(str string) string {
  mut buffer := []u8{}
  mut number := 0
  mut last := ` `
  for ch in str {
    if number == 0 || ch == last {
      number++
    } else {
      if number > 1 {
        digits := '${number}'
        for digit in digits {
          buffer << digit
        }
      }
      buffer << last
      number = 1
    }
    last = ch
  }
  if number != 0 {
    if number > 1 {
      digits := '${number}'
      for digit in digits {
        buffer << digit
      }
    }
    buffer << last
  }
  return buffer.bytestr()
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
