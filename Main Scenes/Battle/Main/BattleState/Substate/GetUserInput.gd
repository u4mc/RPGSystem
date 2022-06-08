extends "res://Main Scenes/Battle/Main/BattleState/BaseState.gd"

var get_battle_action=preload("res://Sub Scenes/UI/Menu/GetBattleAction/GetBattleAction.tscn").instance()
signal confirm
func activate(character):
	self.name="GetUserInput"
	print("Activate Get User Input")
	
	get_battle_action._initialise(character,side_data)
	battle_ui.add_child(get_battle_action)
	
	yield(get_battle_action,"complete")
	
	var out=get_battle_action.output
	
	get_battle_action.finish()
	remove_child(get_battle_action)
	self.queue_free()
	return out
