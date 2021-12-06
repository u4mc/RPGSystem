extends Node

class_name BattleAction
var type:int
var priority:int #Used when sorting the action stack
var resolved:bool #When set to false do not act on this action

var skill:Skill
var battle_effects:Array #Array of BattleEffects


func set_skill(skill_data_arg:Reference,attacker_arg:Array,defender_arg:Array):
	skill=Skill.new()
	skill.initialise(skill_data_arg,attacker_arg,defender_arg)
	

func set_battle_effects():
	pass

func get_skill():
	return skill

func get_battle_effects():
	return battle_effects

func get_skill_message():
	return skill.get_skill_message()
