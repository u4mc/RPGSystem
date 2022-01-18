extends "res://Main Scenes/Battle/Main/BattleState/BaseState.gd"


func activate(character):
	print("Activate Get User Input")
	
	var action=battle_ui.get_user_input(character)
	if action is GDScriptFunctionState:
		action=yield(action,"completed")
	#return action
	return "Test"
