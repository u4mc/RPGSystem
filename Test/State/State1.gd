extends "res://Main Scenes/Battle/Main/BattleState/BaseState.gd"


func activate(arg):
	self.name="State1"
	print("State 1 activate")
	var ss1=.run_substate("substate1",null)
	if ss1 is GDScriptFunctionState: # Still working.
		ss1 = yield(ss1,"completed")
	print("State 1 end")
	yield(get_tree().create_timer(2),"timeout")
	.next_state("state2")



