extends Node

class_name BattleAction
enum type_def {SKILL,DEATH}

var type
var priority:int #Used when sorting the action stack
var resolved:bool #When set to false do not act on this action

var skill:Skill
var battle_effects:Array #Array of BattleEffects

var target

func _set_skill(skill_data_arg:Reference,attacker_arg:Array,defender_arg:Array):
	skill=Skill.new()
	skill.initialise(skill_data_arg,attacker_arg,defender_arg)
	

func set_battle_effects(battle_effects_arg:Array):
	print(self.name+" set battle effects")
	battle_effects=battle_effects_arg
func get_skill():
	return skill

func get_battle_effects():
	return battle_effects

func get_skill_message():
	return skill.get_skill_message()

func set_death_action(target_arg:Node):
	type=type_def.DEATH
	target=target_arg

func set_skill_action(skill_data_arg:Reference,attacker_arg:Array,defender_arg:Array):
	type=type_def.SKILL
	_set_skill(skill_data_arg,attacker_arg,defender_arg)
