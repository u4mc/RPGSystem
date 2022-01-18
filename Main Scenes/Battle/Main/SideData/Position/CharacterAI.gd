extends Node

var ai:Resource

var default_attack_skill=load("res://Resources/Skill/attack.tres")

var target_side

func get_action(skill_list_arg:Resource,side:String,attacker:Node):
	#called by character script
	var battle_action=BattleAction.new()
	
	if ai==null:
		Signals.data.emit_signal("request_opposite_side",funcref(self,"set_target_side"),side)
		battle_action.set_skill_action(default_attack_skill,[attacker],[target_side.get_random_target()])
	
	if target_side.get_random_target()==null:
		print("No valid target!")
		return null
	return battle_action
	
func set_target_side(target_side_arg:Node):
	target_side=target_side_arg
