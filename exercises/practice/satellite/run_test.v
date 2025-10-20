module main

fn test_empty_tree() {
	preorder := ''
	inorder := ''
	expected := fn () Tree {
		return Empty{}
	}
	assert tree_from_traversals(preorder, inorder)! == expected()
}

fn test_tree_with_one_item() {
	preorder := 'a'
	inorder := 'a'
	expected := fn () Tree {
		return Node{
			value: `a`
		}
	}
	assert tree_from_traversals(preorder, inorder)! == expected()
}

fn test_tree_with_many_items() {
	preorder := 'aixfr'
	inorder := 'iafxr'
	expected := fn () Tree {
		return Node{
			left:  Node{
				value: `i`
			}
			right: Node{
				left:  Node{
					value: `f`
				}
				right: Node{
					value: `r`
				}
				value: `x`
			}
			value: `a`
		}
	}
	assert tree_from_traversals(preorder, inorder)! == expected()
}

fn test_reject_traversals_of_different_length() {
	preorder := 'ab'
	inorder := 'bar'
	if _ := tree_from_traversals(preorder, inorder) {
		assert false, 'Reject traversals of different length should return an error'
	} else {
		assert err.msg() == 'traversals must have the same length'
	}
}

fn test_reject_inconsistent_traversals_of_same_length() {
	preorder := 'xyz'
	inorder := 'abc'
	if _ := tree_from_traversals(preorder, inorder) {
		assert false, 'Reject inconsistent traversals of same length should return an error'
	} else {
		assert err.msg() == 'traversals must have the same elements'
	}
}

fn test_reject_traversals_with_repeated_items() {
	preorder := 'aba'
	inorder := 'baa'
	if _ := tree_from_traversals(preorder, inorder) {
		assert false, 'Reject traversals with repeated items should return an error'
	} else {
		assert err.msg() == 'traversals must contain unique items'
	}
}
