extends Resource

var ai:Resource

var attack_skill=load("res://Resources/Skill/attack.tres")

func get_action(var action,var skill_list_arg:Dictionary,var character,var allied_side, var opposing_side:Dictionary):
	#called by character script
	action.actor=character
	if ai==null:
		_default_action(action,opposing_side)
	else:
		pass
	return action
	

func _default_action(var action_arg,var opposing_side):
		print("No AI")
		action_arg.skill=attack_skill
		action_arg.a=opposing_side.values().front()
