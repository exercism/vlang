module main

fn plant(letter rune) string {
  if letter == `G` {
    return "grass"
  }
  if letter == `C` {
    return "clover"
  }
  if letter == `R` {
    return "radishes"
  }
  if letter == `V` {
    return "violets"
  }

  return ""
}

fn plants(diagram string, student string) []string {
  first := 2 * (student[0] - `A`)
  second := first + 1
  third := (diagram.len + 1) / 2 + first
  fourth := third + 1

  return [
    plant(diagram[first]),
    plant(diagram[second]),
    plant(diagram[third]),
    plant(diagram[fourth])
  ]
}
