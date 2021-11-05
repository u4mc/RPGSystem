extends "res://Main Scenes/Battle/BattleData.gd"

export var player_side_pos:Array#String OVERRIDE

export var enemy_side_pos:Array#String OVERRIDE

func get_player_side():
	var i=0
	for p in player_side_pos:
		player_side[i].slot_pos=p
		i=i+1
	return player_side


func get_enemy_side():
	#take enemy side data, use for loop to override position with enemy_side_pos
	var i=0
	for e in enemy_side_pos:
		enemy_side[i].slot_pos=e
		i=i+1
	return enemy_side
