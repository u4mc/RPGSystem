extends "res://Main Scenes/Battle/Main/BattleState/BaseState.gd"

func activate(arg):
	print("Activate Battle Round")
	#Process turn stack
	
	var ts=.run_substate("process_turn_stack",null)
	if ts is GDScriptFunctionState: # Still working.
		ts = yield(ts,"completed")
	print("End Battle Round")
	.next_state("round_start")
