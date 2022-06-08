extends "res://Main Scenes/Battle/Main/BattleState/BaseState.gd"
#var side_data_thread:Thread
#var battle_ui_thread:Thread
#var animation_player_thread:Thread

func activate(action):
	self.name="ProcessAction"
	print("Process action")
#	side_data_thread=Thread.new()
#	battle_ui_thread=Thread.new()
#	animation_player_thread=Thread.new()
	
	#side_data_thread.start(side_data,"process_action",action)
	match action.type:
		"Attack":
			var action_process=action.process()
			if action_process is GDScriptFunctionState: # Still working.
				action_process = yield(action_process,"completed")
		"Death":
			var action_process=action.process(side_data)
			if action_process is GDScriptFunctionState: # Still working.
				action_process = yield(action_process,"completed")
		"Victory":
			var action_process=action.process()
			if action_process is GDScriptFunctionState: # Still working.
				action_process = yield(action_process,"completed")
	
#	#battle_ui_thread.start(battle_ui,"process_action",action)
#	#set UI message
#	var uipa=battle_ui.process_action(action)
#
#	#set animation
#	var animation_process=animation_player.process_action(action)
#
#	if uipa is GDScriptFunctionState:
#		uipa=yield(uipa,"completed")
#
#	if animation_process is GDScriptFunctionState:
#		animation_process=yield(animation_process,"completed")
	self.queue_free()

func _exit_tree():
	pass
#	side_data_thread.wait_to_finish()
#	battle_ui_thread.wait_to_finish()
