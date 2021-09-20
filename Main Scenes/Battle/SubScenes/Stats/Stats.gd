extends Resource


class_name CharacterStats

signal health_changed(new_health, old_health)

export var max_health:int=1 setget set_max_health, _get_max_health


func set_max_health(value: int):
	if value == null:
		return
	max_health = max(1, value)
	


func _get_max_health() -> int:
	return max_health
