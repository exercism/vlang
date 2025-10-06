module main

fn format(name string, number int) string {
    return '${name}, you are the ${number}${suffix(number)} customer we serve today. Thank you!'
}

fn suffix(number int) string {
    last_two := number % 100
    if last_two % 10 == 1 && last_two != 11 {
        return 'st'
    }
    if last_two % 10 == 2 && last_two != 12 {
        return 'nd'
    }
    if last_two % 10 == 3 && last_two != 13 {
        return 'rd'
    }
    return 'th'
}
