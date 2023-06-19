module main

enum BucketId {
	one
	two
}

struct Solution {
	moves        int
	goal_bucket  BucketId
	other_bucket int
}

pub fn measure(capacity_one int, capacity_two int, goal int, start_bucket BucketId) !Solution {
}
