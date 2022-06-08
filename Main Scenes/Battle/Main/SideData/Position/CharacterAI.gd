extends Node

var ai:Resource

var default_attack_skill=load("res://Resources/Skill/attack.tres")

var target_side

func get_action():
	#called by character script
	return
func set_target_side(target_side_arg:Node):
	target_side=target_side_arg
