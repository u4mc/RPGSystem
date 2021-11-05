extends Node

onready var player_side_node=get_node("PlayerSide")
onready var enemy_side=get_node("EnemySide")
onready var turn_logic=get_node("TurnLogic")


func initialise(player_side_arg,enemy_side_arg):
	player_side_node.initialise(player_side_arg)

func _on_Battle_Init():
	pass
func _battle_loop():
	pass
