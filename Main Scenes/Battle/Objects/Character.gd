extends Object
#static values

var HP
var STR
var SPD
var Pos
var skill_list

signal health_change
signal death
signal attack
#variable values
var max_health
var current_health

func health_change():
	emit_signal("health_change",current_health)

func death():
	emit_signal("death")

func basic_attack(target,damage):
	emit_signal("attack",target,damage)
