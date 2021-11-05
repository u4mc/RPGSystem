extends GridContainer


func initialise(var player_data_arg:Array):
	#set data to get_slot(player_data.slot).initialise(player_data)
	for player_data in player_data_arg:
		print("UI"+player_data.slot_pos)
		get_slot(player_data.slot_pos).initialise(player_data)


func get_slot(var slot_pos:String):
	return get_node(slot_pos)

func is_active():
	pass
