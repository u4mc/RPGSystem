extends Node

#default values

const player =preload("res://Sub Scenes/BattleLogic/Scripts/Character.gd")

func _ready():
	#init battle data
	var p =player.new()
	p.HP=2
	pass

func _on_Battle_Init():
	pass
func _battle_loop():
	pass
