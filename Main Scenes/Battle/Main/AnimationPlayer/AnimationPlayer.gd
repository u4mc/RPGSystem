extends Node

var time
func _initialise():
	pass

func _init():

	Signals.battle.connect("emit_battle_action",self,"_on_battle_action_emit")


func _on_battle_action_emit(battle_action:BattleAction,return_function:FuncRef):
	time=0
	while time!=300:
		_tick()
	return_function.call_func()

func _tick():
	time=time+1

func _timeout():
	print("Timed out!")

func process_action(action:BattleAction):
	breakpoint
