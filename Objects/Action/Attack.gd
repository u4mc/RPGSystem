extends Resource

enum TARGET_TYPE{SINGLE,LINE,SET,SELF}

class_name Attack

var type="Attack"

export(String) var name
export(TARGET_TYPE) var target_type
export(Array,bool) var valid_position=[false,false,false]
#shows valid positions attack can be used in
export(Array,bool) var valid_target=[false,false,false]
#shows valid targets
export(String,"Enemy","Ally") var target_side
#Target side
export(int,0,200) var damage_modifier
#Percentage modifier of attack value
export(Array,Resource) var effect_def

#working variables
var effect_list:Array

func add_effect(user_pos,target_pos):
	for e_def in effect_def:
		var effect
		match e_def.effect_type:
			"Damage":
				effect=DamageEffect.new()
				effect.damage=(user_pos.get_damage()*(e_def.modifier/100))
				effect.target_position=target_pos
			"Buff":
				effect=BuffEffect.new()
			"Debuff":
				effect=DebuffEffect.new()
		effect_list.append(effect)

func process():
	_activate_effects()
	
	effect_list.clear()
	
func _activate_effects():
	#iterate through effect list and apply effects
	for e in effect_list:
		e.target_position.apply_effect(e)
	pass

class Effect:
	var target_position:Node

class DamageEffect extends Effect:
	var damage:int
	var damage_type
	
class BuffEffect extends Effect:
	var buff_effect
	var buff_amount

class DebuffEffect extends Effect:
	var debuff_effect
	var debuff_amount

class Test:
	pass
