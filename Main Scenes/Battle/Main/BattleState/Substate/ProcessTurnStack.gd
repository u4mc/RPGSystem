extends "res://Main Scenes/Battle/Main/BattleState/BaseState.gd"

func activate(arg):
	self.name="ProcessTurnStack"
	print("Activate Process Turn Stack")
	while true:
		print("Process turn")
		#Pop turn stack
		var character=side_data.pop_turn_stack()
		
		if character==null:
			break
		#Get action from character
		var action=character.get_action()
		if action==null:
			var user_input=.run_substate("get_user_input",character)
			if user_input is GDScriptFunctionState:
				user_input=yield(user_input,"completed")
				action=user_input
		var pas=.run_substate("process_action_stack",action)
		if pas is GDScriptFunctionState: # Still working.
			pas = yield(pas,"completed")
		
	#repeat until turn stack is empty
	self.queue_free()
