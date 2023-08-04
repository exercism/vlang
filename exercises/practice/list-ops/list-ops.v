module main

pub fn append[T](front []T, back []T) []T {
}

pub fn concat[T](array [][]T) []T {
}

pub fn foldl[T, U](array []T, initial U, folder fn (acc U, e T) U) U {
}

pub fn foldr[T, U](array []T, initial U, folder fn (acc U, e T) U) U {
}

pub fn length[T](array []T) int {
}

pub fn reverse[T](array []T) []T {
}

pub fn filter[T](array []T, predicate fn (e T) bool) []T {
}

// renamed 'map_of' as 'map' conflicts with V 'map' datatype

pub fn map_of[T, U](array []T, mapper fn (e T) U) []U {
}
