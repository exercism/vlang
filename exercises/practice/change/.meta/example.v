module main

fn find_fewest_coins(coins []int, target int) ![]int {
	if target < 0 {
		return error("target can't be negative")
	}

	// The number of coins required to reach a given sub_target.
	mut count := []int{len: target + 1, init: target + 1}
	mut first_coin := []int{len: target + 1}
	count[0] = 0

	for sub_target in 1 .. target + 1 {
		for coin in coins {
			remaining_target := sub_target - coin
			if remaining_target < 0 || count[sub_target] <= count[remaining_target] + 1 {
				continue
			}

			count[sub_target] = count[remaining_target] + 1
			first_coin[sub_target] = coin
		}
	}

	if count[target] > target {
		return error("can't make target with given coins")
	}

	mut result := []int{cap: count[target]}
	for sub_target := target; sub_target != 0; sub_target -= first_coin[sub_target] {
		result << first_coin[sub_target]
	}
	assert result.len == count[target]
	return result
}
