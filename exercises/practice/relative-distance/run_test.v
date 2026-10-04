module main

fn test_direct_parent_child_relation() {
	tree := {
		'Vera':   ['Tomoko']
		'Tomoko': ['Aditi']
	}
	assert degree_of_separation(tree, 'Vera', 'Tomoko')! == 1
}

fn test_sibling_relationship() {
	tree := {
		'Dalia': ['Olga', 'Yassin']
	}
	assert degree_of_separation(tree, 'Olga', 'Yassin')! == 1
}

fn test_two_degrees_of_separation_grandchild() {
	tree := {
		'Khadija': ['Mateo']
		'Mateo':   ['Rami']
	}
	assert degree_of_separation(tree, 'Khadija', 'Rami')! == 2
}

fn test_unrelated_individuals() {
	tree := {
		'Priya': ['Rami']
		'Kaito': ['Elif']
	}
	separation := degree_of_separation(tree, 'Priya', 'Kaito') or { -1 }
	assert separation == -1
}

fn test_complex_graph_cousins() {
	tree := {
		'Aiko':    ['Bao', 'Carlos']
		'Bao':     ['Dalia', 'Elias']
		'Carlos':  ['Fatima', 'Gustavo']
		'Dalia':   ['Hassan', 'Isla']
		'Elias':   ['Javier']
		'Fatima':  ['Khadija', 'Liam']
		'Gustavo': ['Mina']
		'Hassan':  ['Noah', 'Olga']
		'Isla':    ['Pedro']
		'Javier':  ['Quynh', 'Ravi']
		'Khadija': ['Sofia']
		'Liam':    ['Tariq', 'Uma']
		'Mina':    ['Viktor', 'Wang']
		'Noah':    ['Xiomara']
		'Olga':    ['Yuki']
		'Pedro':   ['Zane', 'Aditi']
		'Quynh':   ['Boris']
		'Ravi':    ['Celine']
		'Sofia':   ['Diego', 'Elif']
		'Tariq':   ['Farah']
		'Uma':     ['Giorgio']
		'Viktor':  ['Hana', 'Ian']
		'Wang':    ['Jing']
		'Xiomara': ['Kaito']
		'Yuki':    ['Leila']
		'Zane':    ['Mateo']
		'Aditi':   ['Nia']
		'Boris':   ['Oscar']
		'Celine':  ['Priya']
		'Diego':   ['Qi']
		'Elif':    ['Rami']
		'Farah':   ['Sven']
		'Giorgio': ['Tomoko']
		'Hana':    ['Umar']
		'Ian':     ['Vera']
		'Jing':    ['Wyatt']
		'Kaito':   ['Xia']
		'Leila':   ['Yassin']
		'Mateo':   ['Zara']
		'Nia':     ['Antonio']
		'Oscar':   ['Bianca']
		'Priya':   ['Cai']
		'Qi':      ['Dimitri']
		'Rami':    ['Ewa']
		'Sven':    ['Fabio']
		'Tomoko':  ['Gabriela']
		'Umar':    ['Helena']
		'Vera':    ['Igor']
		'Wyatt':   ['Jun']
		'Xia':     ['Kim']
		'Yassin':  ['Lucia']
		'Zara':    ['Mohammed']
	}
	assert degree_of_separation(tree, 'Dimitri', 'Fabio')! == 9
}

fn test_complex_graph_no_shortcut_far_removed_nephew() {
	tree := {
		'Aiko':    ['Bao', 'Carlos']
		'Bao':     ['Dalia', 'Elias']
		'Carlos':  ['Fatima', 'Gustavo']
		'Dalia':   ['Hassan', 'Isla']
		'Elias':   ['Javier']
		'Fatima':  ['Khadija', 'Liam']
		'Gustavo': ['Mina']
		'Hassan':  ['Noah', 'Olga']
		'Isla':    ['Pedro']
		'Javier':  ['Quynh', 'Ravi']
		'Khadija': ['Sofia']
		'Liam':    ['Tariq', 'Uma']
		'Mina':    ['Viktor', 'Wang']
		'Noah':    ['Xiomara']
		'Olga':    ['Yuki']
		'Pedro':   ['Zane', 'Aditi']
		'Quynh':   ['Boris']
		'Ravi':    ['Celine']
		'Sofia':   ['Diego', 'Elif']
		'Tariq':   ['Farah']
		'Uma':     ['Giorgio']
		'Viktor':  ['Hana', 'Ian']
		'Wang':    ['Jing']
		'Xiomara': ['Kaito']
		'Yuki':    ['Leila']
		'Zane':    ['Mateo']
		'Aditi':   ['Nia']
		'Boris':   ['Oscar']
		'Celine':  ['Priya']
		'Diego':   ['Qi']
		'Elif':    ['Rami']
		'Farah':   ['Sven']
		'Giorgio': ['Tomoko']
		'Hana':    ['Umar']
		'Ian':     ['Vera']
		'Jing':    ['Wyatt']
		'Kaito':   ['Xia']
		'Leila':   ['Yassin']
		'Mateo':   ['Zara']
		'Nia':     ['Antonio']
		'Oscar':   ['Bianca']
		'Priya':   ['Cai']
		'Qi':      ['Dimitri']
		'Rami':    ['Ewa']
		'Sven':    ['Fabio']
		'Tomoko':  ['Gabriela']
		'Umar':    ['Helena']
		'Vera':    ['Igor']
		'Wyatt':   ['Jun']
		'Xia':     ['Kim']
		'Yassin':  ['Lucia']
		'Zara':    ['Mohammed']
	}
	assert degree_of_separation(tree, 'Lucia', 'Jun')! == 14
}

fn test_complex_graph_some_shortcuts_cross_down_and_cross_up_cousins_several_times_removed_with_unrelated_family_tree() {
	tree := {
		'Aiko':    ['Bao', 'Carlos']
		'Bao':     ['Dalia']
		'Carlos':  ['Fatima', 'Gustavo']
		'Dalia':   ['Hassan', 'Isla']
		'Fatima':  ['Khadija', 'Liam']
		'Gustavo': ['Mina']
		'Hassan':  ['Noah', 'Olga']
		'Isla':    ['Pedro']
		'Javier':  ['Quynh', 'Ravi']
		'Khadija': ['Sofia']
		'Liam':    ['Tariq', 'Uma']
		'Mina':    ['Viktor', 'Wang']
		'Noah':    ['Xiomara']
		'Olga':    ['Yuki']
		'Pedro':   ['Zane', 'Aditi']
		'Quynh':   ['Boris']
		'Ravi':    ['Celine']
		'Sofia':   ['Diego', 'Elif']
		'Tariq':   ['Farah']
		'Uma':     ['Giorgio']
		'Viktor':  ['Hana', 'Ian']
		'Wang':    ['Jing']
		'Xiomara': ['Kaito']
		'Yuki':    ['Leila']
		'Zane':    ['Mateo']
		'Aditi':   ['Nia']
		'Boris':   ['Oscar']
		'Celine':  ['Priya']
		'Diego':   ['Qi']
		'Elif':    ['Rami']
		'Farah':   ['Sven']
		'Giorgio': ['Tomoko']
		'Hana':    ['Umar']
		'Ian':     ['Vera']
		'Jing':    ['Wyatt']
		'Kaito':   ['Xia']
		'Leila':   ['Yassin']
		'Mateo':   ['Zara']
		'Nia':     ['Antonio']
		'Oscar':   ['Bianca']
		'Priya':   ['Cai']
		'Qi':      ['Dimitri']
		'Rami':    ['Ewa']
		'Sven':    ['Fabio']
		'Tomoko':  ['Gabriela']
		'Umar':    ['Helena']
		'Vera':    ['Igor']
		'Wyatt':   ['Jun']
		'Xia':     ['Kim']
		'Yassin':  ['Lucia']
		'Zara':    ['Mohammed']
	}
	assert degree_of_separation(tree, 'Wyatt', 'Xia')! == 12
}
