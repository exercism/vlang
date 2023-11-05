module main

fn square_root(radicand u64) u64 {
  mut previous := u64(0)
  mut current := radicand

  for current != previous {
    previous = current
    current = (previous * (previous + 1) + radicand) / (2 * previous)
  }
  return current
}
