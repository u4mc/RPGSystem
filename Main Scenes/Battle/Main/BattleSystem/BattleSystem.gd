extends Node
#Contains functions for processing actions, such as damage calculations


func _init():
	Signals.battle.connect("resolve_skill",self,"resolve_skill")
	Signals.battle.connect("battle_system_test",self,"battle_system_test")

func resolve_skill(skill_arg:Skill,pass_func:FuncRef):
	var battle_effects:Array
	for defender in skill_arg.get_defender():
		battle_effects.append(get_damage_effect(skill_arg.get_attacker(),defender,skill_arg))
	
	
	
	if pass_func!=null:
		pass_func.call_func(battle_effects)
	return battle_effects


func get_damage_effect(attacker,defender,skill):
	var battle_effect=BattleEffect.new()
	var damage_value
	
	var attacker_data=attacker.get_data()
	var defender_data=defender.get_data()
	var skill_data=skill.get_data()
	
	#init damage value
	damage_value=_calc_damage_from_strength(attacker_data.strength)
	damage_value=_calc_damage_from_mod(damage_value,skill_data.modifier)
	#multiplicative damage
	
	#additive damage
	var additive_damage=0
	
	
	damage_value+=additive_damage
	#end
	
	battle_effect.set_damage_event(defender,damage_value)
	return battle_effect

func init_damage_value(attacker_data_arg,defender_data_arg,skill_data_arg):
	pass
func _calc_damage_from_strength(strength):
	return strength
func _calc_damage_from_mod(damage,modifier):
	
	return damage*(modifier/100)
	
func _calc_damage_vs_def(damage,defense):
	return damage-defense
	
func _calc_damage_from_range():
	pass
	
func _calc_crit(damage,crit_rate,crit_mod):
	pass
	
