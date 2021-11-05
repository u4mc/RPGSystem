extends Node2D

func initialise(var enemy_side_arg:Array):
	for e in enemy_side_arg:
		get_node(e.slot_pos).initialise(e.sprite)
