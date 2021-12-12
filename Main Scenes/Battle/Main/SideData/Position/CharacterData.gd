extends Resource

#Should be able to pass graphical data through this (portraits/animations)

#Set data
export var name:String

export var sprite_texture:Texture #Overrides character class sprite

export var max_hp:int

export var current_hp:int

export var strength:int

export var speed:int

export var position:String


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
