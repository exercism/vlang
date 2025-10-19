module main

fn test_empty() {
	mut box := None{}
	assert flatten[int](box) == []
}

fn test_no_nesting() {
	mut box := Many[int]{
		boxes: [
			One[int]{
				value: 0
			},
			One[int]{
				value: 1
			},
			One[int]{
				value: 2
			},
		]
	}
	assert flatten[int](box) == [0, 1, 2]
}

fn test_flattens_a_nested_array() {
	mut box := Many[int]{
		boxes: [
			Many[int]{
				boxes: [
					Many[int]{
						boxes: []
					},
				]
			},
		]
	}
	assert flatten[int](box) == []
}

fn test_flattens_array_with_just_integers_present() {
	mut box := Many[int]{
		boxes: [
			One[int]{
				value: 1
			},
			Many[int]{
				boxes: [
					One[int]{
						value: 2
					},
					One[int]{
						value: 3
					},
					One[int]{
						value: 4
					},
					One[int]{
						value: 5
					},
					One[int]{
						value: 6
					},
					One[int]{
						value: 7
					},
				]
			},
			One[int]{
				value: 8
			},
		]
	}
	assert flatten[int](box) == [1, 2, 3, 4, 5, 6, 7, 8]
}

fn test_5_level_nesting() {
	mut box := Many[int]{
		boxes: [
			One[int]{
				value: 0
			},
			One[int]{
				value: 2
			},
			Many[int]{
				boxes: [
					Many[int]{
						boxes: [
							One[int]{
								value: 2
							},
							One[int]{
								value: 3
							},
						]
					},
					One[int]{
						value: 8
					},
					One[int]{
						value: 100
					},
					One[int]{
						value: 4
					},
					Many[int]{
						boxes: [
							Many[int]{
								boxes: [
									Many[int]{
										boxes: [
											One[int]{
												value: 50
											},
										]
									},
								]
							},
						]
					},
				]
			},
			One[int]{
				value: -2
			},
		]
	}
	assert flatten[int](box) == [0, 2, 2, 3, 8, 100, 4, 50, -2]
}

fn test_6_level_nesting() {
	mut box := Many[int]{
		boxes: [
			One[int]{
				value: 1
			},
			Many[int]{
				boxes: [
					One[int]{
						value: 2
					},
					Many[int]{
						boxes: [
							Many[int]{
								boxes: [
									One[int]{
										value: 3
									},
								]
							},
						]
					},
					Many[int]{
						boxes: [
							One[int]{
								value: 4
							},
							Many[int]{
								boxes: [
									Many[int]{
										boxes: [
											One[int]{
												value: 5
											},
										]
									},
								]
							},
						]
					},
					One[int]{
						value: 6
					},
					One[int]{
						value: 7
					},
				]
			},
			One[int]{
				value: 8
			},
		]
	}
	assert flatten[int](box) == [1, 2, 3, 4, 5, 6, 7, 8]
}

fn test_null_values_are_omitted_from_the_final_result() {
	mut box := Many[int]{
		boxes: [
			One[int]{
				value: 1
			},
			One[int]{
				value: 2
			},
			None{},
		]
	}
	assert flatten[int](box) == [1, 2]
}

fn test_consecutive_null_values_at_the_front_of_the_array_are_omitted_from_the_final_result() {
	mut box := Many[int]{
		boxes: [
			None{},
			None{},
			One[int]{
				value: 3
			},
		]
	}
	assert flatten[int](box) == [3]
}

fn test_consecutive_null_values_in_the_middle_of_the_array_are_omitted_from_the_final_result() {
	mut box := Many[int]{
		boxes: [
			One[int]{
				value: 1
			},
			None{},
			None{},
			One[int]{
				value: 4
			},
		]
	}
	assert flatten[int](box) == [1, 4]
}

fn test_6_level_nested_array_with_null_values() {
	mut box := Many[int]{
		boxes: [
			One[int]{
				value: 0
			},
			One[int]{
				value: 2
			},
			Many[int]{
				boxes: [
					Many[int]{
						boxes: [
							One[int]{
								value: 2
							},
							One[int]{
								value: 3
							},
						]
					},
					One[int]{
						value: 8
					},
					Many[int]{
						boxes: [
							Many[int]{
								boxes: [
									One[int]{
										value: 100
									},
								]
							},
						]
					},
					None{},
					Many[int]{
						boxes: [
							Many[int]{
								boxes: [
									None{},
								]
							},
						]
					},
				]
			},
			One[int]{
				value: -2
			},
		]
	}
	assert flatten[int](box) == [0, 2, 2, 3, 8, 100, -2]
}

fn test_all_values_in_nested_array_are_null() {
	mut box := Many[int]{
		boxes: [
			None{},
			Many[int]{
				boxes: [
					Many[int]{
						boxes: [
							Many[int]{
								boxes: [
									None{},
								]
							},
						]
					},
				]
			},
			None{},
			None{},
			Many[int]{
				boxes: [
					Many[int]{
						boxes: [
							None{},
							None{},
						]
					},
					None{},
				]
			},
			None{},
		]
	}
	assert flatten[int](box) == []
}
