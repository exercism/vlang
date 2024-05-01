module main

fn slices(series string, slice_length int) ![]string {
	if series.len == 0 {
		return error('series cannot be empty')
	}
	if slice_length > series.len {
		return error('slice length cannot be greater than series length')
	}
	if slice_length == 0 {
		return error('slice length cannot be zero')
	}
	if slice_length < 0 {
		return error('slice length cannot be negative')
	}
	mut result := []string{}
	for i in 0 .. (series.len - slice_length + 1) {
		result << series[i..(i + slice_length)]
	}
	return result
}
