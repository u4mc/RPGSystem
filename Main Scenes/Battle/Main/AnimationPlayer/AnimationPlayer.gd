extends Node

var time
func _initialise():
	pass

func _init():

	Signals.battle.connect("emit_battle_action",self,"_on_battle_action_emit")

func _tick():
	time=time+1

func _timeout():
	print("Timed out!")

