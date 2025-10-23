module main

struct Team {
	name string
mut:
	won   int
	drawn int
	lost  int
}

fn (team Team) matches_played() int {
	return team.won + team.drawn + team.lost
}

fn (team Team) points() int {
	return 3 * team.won + team.drawn
}

fn lookup(mut teams []Team, name string) int {
	n := teams.len
	for i in 0 .. n {
		if teams[i].name == name {
			return i
		}
	}
	teams << Team{
		name: name
	}
	return n
}

fn compare_teams(a &Team, b &Team) int {
	if a.points() > b.points() {
		return -1
	}
	if b.points() > a.points() {
		return 1
	}
	if a.name < b.name {
		return -1
	}
	if b.name < a.name {
		return 1
	}
	return 0
}

pub fn tally(rows string) string {
	mut teams := []Team{}
	for row in rows.split('\n') {
		if row == '' {
			continue
		}

		line := row.split(';')
		first := lookup(mut teams, line[0])
		second := lookup(mut teams, line[1])
		match line[2] {
			'win' {
				teams[first].won = teams[first].won + 1
				teams[second].lost = teams[second].lost + 1
			}
			'draw' {
				teams[first].drawn = teams[first].drawn + 1
				teams[second].drawn = teams[second].drawn + 1
			}
			'loss' {
				teams[first].lost = teams[first].lost + 1
				teams[second].won = teams[second].won + 1
			}
			else {}
		}
	}
	teams.sort_with_compare(compare_teams)

	mut result := []string{cap: 1 + teams.len}
	result << 'Team                           | MP |  W |  D |  L |  P'
	for team in teams {
		result << '${team.name:-31}|${team.matches_played():3} |${team.won:3} |${team.drawn:3} |${team.lost:3} |${team.points():3}'
	}
	assert result.len == 1 + teams.len
	return result.join('\n')
}
