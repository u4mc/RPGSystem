extends "res://Main Scenes/Battle/Main/BattleState/BaseState.gd"



func activate(arg):
	self.name="State2"
	print("State 2 activate")
	yield(get_tree().create_timer(3),"timeout")
	print("State 2 end")
	next_state("state1")
