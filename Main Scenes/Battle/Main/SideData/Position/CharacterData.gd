extends Resource

#Should be able to pass graphical data through this (portraits/animations)

#Set data
export var name:String

export var sprite_texture:Texture #Overrides character class sprite

export var max_hp:int

var current_hp:int

export var strength:int

export var speed:int

export var position:String


func raise_health(value_arg):
	current_hp=current_hp+value_arg
	if current_hp>max_hp:
		current_hp=max_hp

func lower_health(value_arg):
	current_hp=current_hp-value_arg
	if current_hp<0:
		current_hp=0
