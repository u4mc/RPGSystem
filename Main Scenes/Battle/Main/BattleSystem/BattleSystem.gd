extends Node
#Contains functions for processing actions, such as damage calculations


func _initialise():
	pass


func resolve_skill(skill_arg:Skill):
	var battle_effects:Array
	battle_effects.append(get_damage_event(null,null,null))
	return battle_effects
	pass


func get_damage_event(attacker,defender,skill):
	var battle_effect:BattleEffect
	
	battle_effect.target=defender
	battle_effect.type=battle_effect.type_def.DAMAGE
	
	var attacker_data=attacker.get_data()
	var defender_data=defender.get_data()
	var skill_data=skill.get_data()
	
	battle_effect.damage=_calc_damage_from_atk(attacker_data.strength)
	battle_effect.damage=_calc_damage_from_mod(battle_effect.damage,skill_data.modifier)
	return battle_effect

func _calc_damage_from_atk(attack):
	return attack
func _calc_damage_from_mod(damage,modifier):
	return damage*(modifier/100)
	
func _calc_damage_vs_def(damage,defense):
	return damage-defense
	
func _calc_damage_from_range():
	pass
	
func _calc_crit(damage,crit_rate,crit_mod):
	pass
