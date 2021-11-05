extends Node

var UI_data_slot:Array
func _ready():
	UI_data_slot.append(get_node("Player Data/Control2/Container"))

func initialise(var player_data:Array):
	UI_data_slot[0].set_name(player_data[0].name)
	pass
