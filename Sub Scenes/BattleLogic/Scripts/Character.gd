extends Object
#static values

var HP
var STR
var SPD
var skill_list
signal s

#variable values
var max_health
var current_health

func use_skill():
	emit_signal("s")
	pass

