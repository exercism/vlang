module main

import rand

// define the Robot struct here
struct Robot {
mut:
	name string
}

// we need a place to store all these robots!
// this should probably be an array or a map
fn create_robot_storage() []bool {
	return []bool{len: 676000, init: false}
}

fn create_robot(mut robots []bool) Robot {
	new_name := generate_unused_name(mut robots) or { 'error: ${err.msg()}' }
	return Robot{
		name: new_name
	}
}

fn (mut r Robot) reset(mut robots []bool) {
	index := convert_name_to_index(r.name)
	robots[index] = false

	r.name = generate_unused_name(mut robots) or { 'error: ${err.msg()}' }
}

fn generate_unused_name(mut robots []bool) !string {
	if false !in robots {
		return error('no unused robot names')
	}
	mut new_name := generate_any_valid_name()

	for robots[convert_name_to_index(new_name)] {
		new_name = generate_any_valid_name()
	}
	robots[convert_name_to_index(new_name)] = true

	return new_name
}

fn generate_any_valid_name() string {
	mut new_name := rand.string(2).to_upper()
	d1 := rand.intn(10) or {0}
	d2 := rand.intn(10) or {0}
	d3 := rand.intn(10) or {0}
	new_name += d1.str()
	new_name += d2.str()
	new_name += d3.str()

	return new_name
}

fn convert_name_to_index(name string) int {
	// AA000 -> 0
	// AA001 -> 1
	// AA999 -> 999
	// AB000 -> 1000
	// AZ000 -> 25000
	// AZ999 -> 25999
	// BA000 -> 26000
	// BB000 -> 27000
	// ZZ999 ->

	// first character is num in alphabet (0-indexed from A) -1 then multiply by 26k
	// second character is num in alphabet (0-indexed from A) -1 then multiply by 1k
	// then just add numbers
	first_num := int(name[0] - `A`) * 26000
	second_num := int(name[1] - `A`) * 1000
	final_num := name[2..5].int()

	return first_num + second_num + final_num
}
