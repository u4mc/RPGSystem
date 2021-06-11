extends Node2D

onready var prototype_player=get_node(".")

func ready():
	
	pass

func _process(delta):
	prototype_player.move_local_x(1)
	pass
