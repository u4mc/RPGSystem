extends "res://Main Scenes/Battle/Main/BattleState/BaseState.gd"


func activate(arg):
	self.name="Substate1"
	print ("Substate 1 activate")
	yield(get_tree().create_timer(2),"timeout")
	var ss2=.run_substate("substate2",null)
	if ss2 is GDScriptFunctionState: # Still working.
		ss2 = yield(ss2,"completed")
	print("Substate 1 end")
