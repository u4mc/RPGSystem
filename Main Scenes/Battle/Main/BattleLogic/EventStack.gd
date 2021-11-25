extends Node

var event_stack

signal stack_empty

func process_action(action_arg:Array):
	for action in action_arg:
		_poll_reactions(action)

	

func _poll_reactions(action):
	
	pass
	
func _pop_stack():
	if event_stack.empty==false:
		pass
	else:
		emit_signal("stack_empty")
