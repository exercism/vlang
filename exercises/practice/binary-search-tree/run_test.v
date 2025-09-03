module main

fn test_data_is_retained() {
	mut root := Node.new(4)
	assert root.data == 4
	assert root.left is Empty
	assert root.right is Empty
}

fn test_insert_data_at_proper_node__smaller_number_at_left_node() {
	mut root := Node.new(4)
	root.insert(2)
	assert root.data == 4
	assert root.left is Node
	l := root.left as Node
	assert l.data == 2
	assert l.left is Empty
	assert l.right is Empty
	assert root.right is Empty
}

fn test_insert_data_at_proper_node__same_number_at_left_node() {
	mut root := Node.new(4)
	root.insert(4)
	assert root.data == 4
	assert root.left is Node
	l := root.left as Node
	assert l.data == 4
	assert l.left is Empty
	assert l.right is Empty
	assert root.right is Empty
}

fn test_insert_data_at_proper_node__greater_number_at_right_node() {
	mut root := Node.new(4)
	root.insert(5)
	assert root.data == 4
	assert root.left is Empty
	assert root.right is Node
	r := root.right as Node
	assert r.data == 5
	assert r.left is Empty
	assert r.right is Empty
}

fn test_can_create_complex_tree() {
	mut root := Node.new(4)
	root.insert(2)
	root.insert(6)
	root.insert(1)
	root.insert(3)
	root.insert(5)
	root.insert(7)
	assert root.data == 4
	assert root.left is Node
	l := root.left as Node
	assert l.data == 2
	assert l.left is Node
	ll := l.left as Node
	assert ll.data == 1
	assert ll.left is Empty
	assert ll.right is Empty
	assert l.right is Node
	lr := l.right as Node
	assert lr.data == 3
	assert lr.left is Empty
	assert lr.right is Empty
	assert root.right is Node
	r := root.right as Node
	assert r.data == 6
	assert r.left is Node
	rl := r.left as Node
	assert rl.data == 5
	assert rl.left is Empty
	assert rl.right is Empty
	assert r.right is Node
	rr := r.right as Node
	assert rr.data == 7
	assert rr.left is Empty
	assert rr.right is Empty
}

fn test_can_sort_data__can_sort_single_number() {
	mut root := Node.new(2)
	assert sorted_data(root) == [2]
}

fn test_can_sort_data__can_sort_if_second_number_is_smaller_than_first() {
	mut root := Node.new(2)
	root.insert(1)
	assert sorted_data(root) == [1, 2]
}

fn test_can_sort_data__can_sort_if_second_number_is_same_as_first() {
	mut root := Node.new(2)
	root.insert(2)
	assert sorted_data(root) == [2, 2]
}

fn test_can_sort_data__can_sort_if_second_number_is_greater_than_first() {
	mut root := Node.new(2)
	root.insert(3)
	assert sorted_data(root) == [2, 3]
}

fn test_can_sort_data__can_sort_complex_tree() {
	mut root := Node.new(2)
	root.insert(1)
	root.insert(3)
	root.insert(6)
	root.insert(7)
	root.insert(5)
	assert sorted_data(root) == [1, 2, 3, 5, 6, 7]
}
