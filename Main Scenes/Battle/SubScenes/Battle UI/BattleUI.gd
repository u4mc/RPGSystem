extends Node

onready var player_data=get_node("Player Data/Control2")
func _ready():
	pass

func initialise(var arg:Array):
	player_data.initialise(arg)
	pass
