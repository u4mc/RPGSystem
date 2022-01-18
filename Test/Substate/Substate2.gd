extends "res://Main Scenes/Battle/Main/BattleState/BaseState.gd"

func _init():
	self.name="Substate2"

func activate(arg):

	print("Substate 2 activate")
	print("Substate says "+arg)
	yield(get_tree().create_timer(2),"timeout")
	print("Substate 2 end")
	return "Test"
