extends Node
var active=false
var next_state


var states={
	"round_start":load("res://Main Scenes/Battle/Main/BattleState/State/RoundStart.gd"),
	"battle_round":load("res://Main Scenes/Battle/Main/BattleState/State/BattleRound.gd")
}
var substates={
	"process_turn_stack":load("res://Main Scenes/Battle/Main/BattleState/Substate/ProcessTurnStack.gd"),
	"process_action_stack":load("res://Main Scenes/Battle/Main/BattleState/Substate/ProcessActionStack.gd"),
	"get_user_input":load("res://Main Scenes/Battle/Main/BattleState/Substate/GetUserInput.gd"),
	"process_action":load("res://Main Scenes/Battle/Main/BattleState/Substate/ProcessAction.gd")
}

func set_next_state(arg):
	next_state=arg

func run_state():
	active=true
	var state=states.get(next_state).new()
	next_state=null
	state=init_state(state)
	var st=state.activate(null)
	if st is GDScriptFunctionState: # Still working.
		st = yield(st,"completed")
	remove_child(state)
	active=false

func init_state(state):
	self.add_child(state)
	state.battle=self
	state.background=get_background()
	state.side_data=get_side_data()
	state.animation_player=get_animation_player()
	state.battle_ui=get_battle_ui()
	return state

func get_substate(arg):
	var substate= substates.get(arg).new()
	substate=init_state(substate)
	return substate

func _notification(what):
	match what:
		NOTIFICATION_PARENTED:
			if get_parent().name=="root":
				print("Get Test Data "+self.name)
				_initialise(load("res://Resources/test/battle/TestBattle.tres"))

func _initialise(var battle_arg):
	$SideData._initialise(battle_arg.player_side,battle_arg.enemy_side)
	$BattleUI._initialise()
	$Background._initialise()
	$AnimationPlayer._initialise()
	
func _process(delta):
	if active==true||next_state==null:
		return
	run_state()



func get_background():
	return $Background

func get_side_data():
	return $SideData

func get_animation_player():
	return $AnimationPlayer

func get_battle_ui():
	return $BattleUI

func _on_Button_pressed():
	set_next_state("round_start")
