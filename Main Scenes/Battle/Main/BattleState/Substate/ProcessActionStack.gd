extends "res://Main Scenes/Battle/Main/BattleState/BaseState.gd"

func activate(action_arg):
	print("Process Action Stack")
	battle_logic.push_action_stack(action_arg)
	while true:
		var action=battle_logic.pop_action_stack()
		if action==null:
			break
		action=battle_logic.resolve_action(action)#validate action
		#perform action
		var pa=.run_substate("process_action",action)
		if pa is GDScriptFunctionState: # Still working.
				pa = yield(pa,"completed")
