module main

type Domino = []int

fn search(mut dominoes []Domino, remaining int) bool {
    if remaining == 0 {
        return dominoes[0][0] == dominoes[dominoes.len - 1][1]
    }

    for i in 0..remaining {
        if dominoes[i][0] == dominoes[remaining][0] {
            dominoes[i][0], dominoes[i][1] = dominoes[i][1], dominoes[i][0]
        }

        if dominoes[i][1] != dominoes[remaining][0] {
            continue
        }

        dominoes[i], dominoes[remaining - 1] = dominoes[remaining - 1], dominoes[i]

        if search(mut dominoes, remaining - 1) {
            return true
        }

        dominoes[i], dominoes[remaining - 1] = dominoes[remaining - 1], dominoes[i]
    }

    return false
}

fn can_chain(dominoes []Domino) bool {
    if dominoes.len == 0 {
        return true
    }

    mut dominoes2 := dominoes.clone()
    return search(mut dominoes2, dominoes.len - 1)
}
