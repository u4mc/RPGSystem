extends Node
#BattleState

var battle

var background
var side_data
var battle_logic
var animation_player
var battle_ui

signal swap_state(state,args)

func activate(arg):
	pass
func set_state_machine(battle_arg):
	battle=battle_arg
	background=battle.get_background()
	side_data=battle.get_side_data()
	battle_logic=battle.get_battle_logic()
	animation_player=battle.get_animation_player()
	battle_ui=battle.get_battle_ui()

func swap_state(state):
	battle.swap_state(state)
	self.queue_free()

func start_task(task_arg,args):
	var task=battle.get_task(task_arg)
	self.add_child(task)
	self.queue_free()
	task=task.activate(args)
	if task is GDScriptFunctionState: # Still working.
		print("TASK WAIT")
		task = yield(task, "completed")
	return task
