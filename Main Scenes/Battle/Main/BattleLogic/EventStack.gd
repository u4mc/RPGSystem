extends Node

var event_stack

signal stack_empty

func process_action(action_arg:Node):
	Signals.battle.emit_signal("emit_battle_action")
	pass


func _poll_reactions(action):
	
	pass
	
func _pop_stack():
	if event_stack.empty==false:
		pass
	else:
		emit_signal("stack_empty")
