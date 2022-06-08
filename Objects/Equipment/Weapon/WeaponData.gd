extends Resource

class_name Weapon

enum weapon_type {THRUSTING_SWORD,SWORD}

export var name:String
#Weapon Name
export(weapon_type) var type
#Weapon Type
export var damage_range_min:int
#Minimum Weapon Damage
export var damage_range_max:int
#Maximum Weapon Damage
export var strength_scaling:float
#Weapon scaling from strength
export var dexterity_scaling:float
#Weapon scaling from dex
export(Array,Resource) var attack_list
#Array of assigned attacks


func get_weapon_attack(strength:int,dexterity:int):
	var range_min=damage_range_min+(dexterity*dexterity_scaling)
	var range_max=damage_range_max+(strength*strength_scaling)
	return _get_damage_from_range(range_max,range_min)

func get_attack_list():
	return attack_list


func _get_range_max():
	pass
	
func _get_range_min():
	pass
	
func _scaling_adjust(damage:int,stat:int,scaling:float):
	return damage+(stat*scaling)
	
func _minor_scaling_adjust(damage:int,stat:int,scaling:float):
	return damage+((stat*scaling)*0.5)

func _get_damage_from_range(dmg_max:int,dmg_min:int):
	#get rand between dmg_min and dmg_max
	return rand_range(dmg_min,dmg_max)
