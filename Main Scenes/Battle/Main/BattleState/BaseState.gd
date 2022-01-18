extends Node

var battle
var background
var side_data
var battle_logic
var animation_player
var battle_ui
func activate(arg):
	pass
	
func next_state(state_arg):
	battle.set_next_state(state_arg)

func run_substate(substate_arg,args):
	var substate=battle.get_substate(substate_arg)
	substate.battle=battle
	add_child(substate)
	var ss=substate.activate(args)
	if ss is GDScriptFunctionState: # Still working.
		ss = yield(ss,"completed")
	return ss
