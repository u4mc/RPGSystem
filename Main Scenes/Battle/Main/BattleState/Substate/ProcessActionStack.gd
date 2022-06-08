extends "res://Main Scenes/Battle/Main/BattleState/BaseState.gd"

func activate(action_arg):
	self.name="ProcessActionStack"
	print("Process Action Stack")
	if action_arg!=null:
		side_data.push_action_stack(action_arg)#replace with signal
	while true:
		var action=side_data.pop_action_stack()
		if action==null:
			break
		var pa=.run_substate("process_action",action)
		if pa is GDScriptFunctionState: # Still working.
				pa = yield(pa,"completed")
	self.queue_free()
	#if action stack is empty then return to turn stack
