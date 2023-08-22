module main

const (
	empty         = CustomSet.new([]int{})
	another_empty = CustomSet.new([]int{})
	non_empty     = CustomSet.new([1])
)

// is_empty

fn test_sets_with_no_elements_are_empty() {
	assert empty.is_empty()
}

fn test_sets_with_elements_are_not_empty() {
	assert !non_empty.is_empty()
}

// contains

fn test_nothing_is_contained_in_an_empty_set() {
	assert !empty.contains(1)
}

fn test_when_the_element_is_in_the_set() {
	a_set := CustomSet.new([1, 2, 3])

	assert a_set.contains(1)
}

fn test_when_the_element_is_not_in_the_set() {
	a_set := CustomSet.new([1, 2, 3])

	assert !a_set.contains(4)
}

// is_subset

fn test_empty_set_is_a_subset_of_another_empty_set() {
	assert empty.is_subset(another_empty)
}

fn test_empty_set_is_a_subset_of_non_empty_set() {
	assert empty.is_subset(non_empty)
}

fn test_non_empty_set_is_not_a_subset_of_empty_set() {
	assert !non_empty.is_subset(empty)
}

fn test_set_is_a_subset_of_set_with_exact_same_elements() {
	a_set := CustomSet.new([1, 2, 3])
	b_set := CustomSet.new([1, 2, 3])

	assert a_set.is_subset(b_set)
}

fn test_set_is_a_subset_of_larger_set_with_same_elements() {
	a_set := CustomSet.new([1, 2, 3])
	b_set := CustomSet.new([1, 2, 3, 4])

	assert a_set.is_subset(b_set)
}

fn test_set_is_not_a_subset_of_set_that_does_not_contain_its_elements() {
	a_set := CustomSet.new([1, 2, 3])
	b_set := CustomSet.new([4, 1, 3])

	assert !a_set.is_subset(b_set)
}

// is_disjoint

fn test_the_empty_set_is_disjoint_with_itself() {
	assert empty.is_disjoint(another_empty)
}

fn test_empty_set_is_disjoint_with_non_empty_set() {
	assert empty.is_disjoint(non_empty)
}

fn test_non_empty_set_is_disjoint_with_empty_set() {
	assert non_empty.is_disjoint(empty)
}

fn test_sets_are_not_disjoint_if_they_share_an_element() {
	a_set := CustomSet.new([1, 2])
	b_set := CustomSet.new([2, 3])

	assert !a_set.is_disjoint(b_set)
}

fn test_sets_are_disjoint_if_they_share_no_elements() {
	a_set := CustomSet.new([1, 2])
	b_set := CustomSet.new([3, 4])

	assert a_set.is_disjoint(b_set)
}

// equal

fn test_empty_sets_are_equal() {
	assert empty.equal(another_empty)
}

fn test_empty_set_is_not_equal_to_non_empty_set() {
	a_set := CustomSet.new([1, 2, 3])

	assert !empty.equal(a_set)
}

fn test_non_empty_set_is_not_equal_to_empty_set() {
	a_set := CustomSet.new([1, 2, 3])

	assert !a_set.equal(empty)
}

fn test_sets_with_the_same_elements_are_equal() {
	a_set := CustomSet.new([1, 2])
	b_set := CustomSet.new([2, 1])

	assert a_set.equal(b_set)
}

fn test_sets_with_different_elements_are_not_equal() {
	a_set := CustomSet.new([1, 2, 3])
	b_set := CustomSet.new([1, 2, 4])

	assert !a_set.equal(b_set)
}

fn test_set_is_not_equal_to_larger_set_with_same_elements() {
	a_set := CustomSet.new([1, 2, 3])
	b_set := CustomSet.new([1, 2, 3, 4])

	assert !a_set.equal(b_set)
}

// add

fn test_add_to_empty_set() {
	mut a_set := CustomSet.new([]int{})
	expected := CustomSet.new([3])

	a_set.add(3)

	assert a_set.equal(expected)
}

fn test_add_to_non_empty_set() {
	mut a_set := CustomSet.new([1, 2, 4])
	expected := CustomSet.new([1, 2, 3, 4])

	a_set.add(3)

	assert a_set.equal(expected)
}

fn test_adding_an_existing_element_does_not_change_the_set() {
	mut a_set := CustomSet.new([1, 2, 3])
	expected := CustomSet.new([1, 2, 3])

	a_set.add(3)

	assert a_set.equal(expected)
}

// intersection

fn test_intersection_of_two_empty_sets_is_an_empty_set() {
	expected := CustomSet.new([]int{})

	assert empty.intersection(another_empty).equal(expected)
}

fn test_intersection_of_an_empty_set_and_non_empty_set_is_an_empty_set() {
	a_set := CustomSet.new([3, 2, 5])
	expected := CustomSet.new([]int{})

	assert empty.intersection(a_set).equal(expected)
}

fn test_intersection_of_a_non_empty_set_and_an_empty_set_is_an_empty_set() {
	a_set := CustomSet.new([1, 2, 3, 4])

	assert a_set.intersection(empty).equal(another_empty)
}

fn test_intersection_of_two_sets_with_no_shared_elements_is_an_empty_set() {
	a_set := CustomSet.new([1, 2, 3])
	b_set := CustomSet.new([4, 5, 6])

	assert a_set.intersection(b_set).equal(empty)
}

fn test_intersection_of_two_sets_with_shared_elements_is_a_set_of_the_shared_elements() {
	a_set := CustomSet.new([1, 2, 3, 4])
	b_set := CustomSet.new([3, 2, 5])
	expected := CustomSet.new([2, 3])

	assert a_set.intersection(b_set).equal(expected)
}

// difference

fn test_difference_of_two_empty_sets_is_an_empty_set() {
	expected := CustomSet.new([]int{})

	assert empty.difference(another_empty).equal(expected)
}

fn test_difference_of_empty_set_and_non_empty_set_is_an_empty_set() {
	a_set := CustomSet.new([3, 2, 5])

	assert empty.difference(a_set).equal(another_empty)
}

fn test_difference_of_a_non_empty_set_and_an_empty_set_is_the_non_empty_set() {
	a_set := CustomSet.new([1, 2, 3, 4])
	expected := CustomSet.new([1, 2, 3, 4])

	assert a_set.difference(empty).equal(expected)
}

fn test_difference_of_two_non_empty_sets_is_a_set_of_elements_that_are_only_in_the_first_set() {
	a_set := CustomSet.new([3, 2, 1])
	b_set := CustomSet.new([2, 4])
	expected := CustomSet.new([1, 3])

	assert a_set.difference(b_set).equal(expected)
}

// @union

fn test_union_of_empty_sets_is_an_empty_set() {
	expected := CustomSet.new([]int{})

	assert empty.@union(another_empty).equal(expected)
}

fn test_union_of_an_empty_set_and_non_empty_set_is_the_non_empty_set() {
	a_set := CustomSet.new([2])
	expected := CustomSet.new([2])

	assert empty.@union(a_set).equal(expected)
}

fn test_union_of_a_non_empty_set_and_empty_set_is_the_non_empty_set() {
	a_set := CustomSet.new([1, 3])
	expected := CustomSet.new([1, 3])

	assert a_set.@union(empty).equal(expected)
}

fn test_union_of_non_empty_sets_contains_all_unique_elements() {
	a_set := CustomSet.new([1, 3])
	b_set := CustomSet.new([2, 3])
	expected := CustomSet.new([3, 2, 1])

	assert a_set.@union(b_set).equal(expected)
}
