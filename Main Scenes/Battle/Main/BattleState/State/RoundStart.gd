extends "res://Main Scenes/Battle/Main/BattleState/BaseState.gd"


func activate(arg):
	self.name="RoundStart"
	print("Activate Round Start")
	#Populate turn order
	side_data.set_turn_order()
	#Get start of round actions
	print("End Round Start")
	.next_state("battle_round")
#	var tm1=battle_ui.test_message()
#	if tm1 is GDScriptFunctionState: # Still working.
#		tm1 = yield(tm1,"completed")
#
#	var ss=.run_substate("substate2","Stuff")
#	if ss is GDScriptFunctionState:
#		ss=yield(ss,"completed")
#	breakpoint
