module main

fn test_direct_parent_child_relation() {
	tree := {
		'Vera':   ['Tomoko']
		'Tomoko': ['Aditi']
	}
	if res := degree_of_separation(tree, 'Vera', 'Tomoko') {
		assert res == 1
	} else {
		assert false, "degree_of_separation(tree, 'Vera', 'Tomoko') should not return an error"
	}
}

fn test_sibling_relationship() {
	tree := {
		'Dalia': ['Olga', 'Yassin']
	}
	if res := degree_of_separation(tree, 'Olga', 'Yassin') {
		assert res == 1
	} else {
		assert false, "degree_of_separation(tree, 'Olga', 'Yassin') should not return an error"
	}
}

fn test_two_degrees_of_separation_grandchild() {
	tree := {
		'Khadija': ['Mateo']
		'Mateo':   ['Rami']
	}
	if res := degree_of_separation(tree, 'Khadija', 'Rami') {
		assert res == 2
	} else {
		assert false, "degree_of_separation(tree, 'Khadija', 'Rami') should not return an error"
	}
}

fn test_unrelated_individuals() {
	tree := {
		'Priya': ['Rami']
		'Kaito': ['Elif']
	}
	if res := degree_of_separation(tree, 'Priya', 'Kaito') {
		assert false, 'Unrelated individuals should return an error'
	} else {
		assert true
	}
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
	if res := degree_of_separation(tree, 'Dimitri', 'Fabio') {
		assert res == 9
	} else {
		assert false, "degree_of_separation(tree, 'Dimitri', 'Fabio') should not return an error"
	}
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
	if res := degree_of_separation(tree, 'Lucia', 'Jun') {
		assert res == 14
	} else {
		assert false, "degree_of_separation(tree, 'Lucia', 'Jun') should not return an error"
	}
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
	if res := degree_of_separation(tree, 'Wyatt', 'Xia') {
		assert res == 12
	} else {
		assert false, "degree_of_separation(tree, 'Wyatt', 'Xia') should not return an error"
	}
}
