extends "res://Main Scenes/Battle/Main/BattleState/BaseState.gd"
#var side_data_thread:Thread
#var battle_ui_thread:Thread
#var animation_player_thread:Thread

func activate(action):
	print("Process action")

#	side_data_thread=Thread.new()
#	battle_ui_thread=Thread.new()
#	animation_player_thread=Thread.new()
	
	#side_data_thread.start(side_data,"process_action",action)
	var sdpa=side_data.process_action(action)
	if sdpa is GDScriptFunctionState: # Still working.
		sdpa = yield(sdpa,"completed")
	
	#battle_ui_thread.start(battle_ui,"process_action",action)
	var uipa=battle_ui.process_action(action)
	
	var animation_process=animation_player.process_action(action)
	
	if uipa is GDScriptFunctionState:
		uipa=yield(uipa,"completed")
	if animation_process is GDScriptFunctionState:
		animation_process=yield(animation_process,"completed")

func _exit_tree():
	pass
#	side_data_thread.wait_to_finish()
#	battle_ui_thread.wait_to_finish()
