module main

fn test_measure_using_bucket_one_of_size_3_and_bucket_two_of_size_5___start_with_bucket_one() {
	expected := Solution{
		moves: 4
		goal_bucket: BucketId.one
		other_bucket: 5
	}
	assert measure(3, 5, 1, BucketId.one)! == expected
}

fn test_measure_using_bucket_one_of_size_3_and_bucket_two_of_size_5___start_with_bucket_two() {
	expected := Solution{
		moves: 8
		goal_bucket: BucketId.two
		other_bucket: 3
	}
	assert measure(3, 5, 1, BucketId.two)! == expected
}

fn test_measure_using_bucket_one_of_size_7_and_bucket_two_of_size_11___start_with_bucket_one() {
	expected := Solution{
		moves: 14
		goal_bucket: BucketId.one
		other_bucket: 11
	}
	assert measure(7, 11, 2, BucketId.one)! == expected
}

fn test_measure_using_bucket_one_of_size_7_and_bucket_two_of_size_11___start_with_bucket_two() {
	expected := Solution{
		moves: 18
		goal_bucket: BucketId.two
		other_bucket: 7
	}
	assert measure(7, 11, 2, BucketId.two)! == expected
}

fn test_measure_one_step_using_bucket_one_of_size_1_and_bucket_two_of_size_3___start_with_bucket_two() {
	expected := Solution{
		moves: 1
		goal_bucket: BucketId.two
		other_bucket: 0
	}
	assert measure(1, 3, 3, BucketId.two)! == expected
}

fn test_measure_using_bucket_one_of_size_2_and_bucket_two_of_size_3___start_with_bucket_one_and_end_with_bucket_two() {
	expected := Solution{
		moves: 2
		goal_bucket: BucketId.two
		other_bucket: 2
	}
	assert measure(2, 3, 3, BucketId.one)! == expected
}

fn test_not_possible_to_reach_the_goal() {
	if res := measure(6, 15, 5, BucketId.one) {
		assert false, 'Not possible to reach the goal should return an error'
	} else {
		assert err.msg() == 'impossible'
	}
}

fn test_with_the_same_buckets_but_a_different_goal_then_it_is_possible() {
	expected := Solution{
		moves: 10
		goal_bucket: BucketId.two
		other_bucket: 0
	}
	assert measure(6, 15, 9, BucketId.one)! == expected
}

fn test_goal_larger_than_both_buckets_is_impossible() {
	if res := measure(5, 7, 8, BucketId.one) {
		assert false, 'Goal larger than both buckets impossible should return an error'
	} else {
		assert err.msg() == 'impossible'
	}
}
