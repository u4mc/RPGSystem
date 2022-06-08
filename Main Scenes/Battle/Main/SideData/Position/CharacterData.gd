extends Resource

#Should be able to pass graphical data through this (portraits/animations)
enum positions {FRONT,MID,BACK}
#Set data
export var name:String
#Character Name
export var character_class:Resource
#Character Class
export var character_level:int
#Level of character
export(positions) var position
#Character Position
export var sprite_texture:Texture #Overrides character class sprite
#Character Stats
export var max_hp:int
#Maximum HP of character
export var strength:int
#Increases damage ceiling of weapon
export var dexterity:int
#Increases damage floor of weapon
export var speed:int
#Dictates turn order

#Working Stats
export var current_hp:int
#Current HP
var damage_reduction:int
#Determines reduction in damage
var damage_threshold:int
#Determines threshold to pierce damage resistance
var weapon_attack_min:int
#Minimum weapon attack value
var weapon_attack_max:int
#Maximum weapon attack value

#Equipment
export var weapon:Resource
#Equipped weapon
export var armour:Resource
#Equipped armour
export var trinket_1:Resource
#Equipped trinket in slot 1
export var trinket_2:Resource
#Equipped trinket in slot 2

export(Array,Resource) var attack_list
#List of inherent attacks
var skill_list:Array
#List of inherent  skills
var magic_list:Array
#List of inherent abilities

func get_weapon_attack():
	var wAtt= weapon.get_weapon_attack(strength,dexterity)
	return wAtt

func get_attack_list():
	return attack_list

func get_magic_list():
	return magic_list

func get_skill_list():
	return skill_list

func raise_health(value_arg):
	current_hp=current_hp+value_arg
	if current_hp>max_hp:
		current_hp=max_hp

func lower_hp(value_arg):
	current_hp=current_hp-value_arg
	if current_hp<0:
		current_hp=0

func get_current_hp():
	return current_hp

func _load():
	if current_hp==null:
		current_hp=max_hp
