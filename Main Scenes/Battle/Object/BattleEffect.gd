extends Reference


class_name BattleEffect

enum type_def {DAMAGE}

var type
var target:Node
var value


func set_damage_event(var target_arg, var damage_value_arg):
	type=type_def.DAMAGE
	target=target_arg
	value=damage_value_arg
