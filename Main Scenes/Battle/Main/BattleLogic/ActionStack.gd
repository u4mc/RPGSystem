extends Node

var action_stack:Array

var return_count
const return_max=2
func _init():
	Signals.battle.connect("push_action_stack",self,"_push_stack")

func _process_action(action_arg):
	return_count=0
	match action_arg.type:
		action_arg.type_def.SKILL:
			Signals.battle.emit_signal("resolve_skill",action_arg.get_skill(),funcref(action_arg,"set_battle_effects"))
		action_arg.type_def.DEATH:
			pass
	Signals.battle.emit_signal("emit_battle_action",action_arg,funcref(self,"_increment_return_count"))
	while return_count!=return_max:
		pass

func _pop_stack():
	_process_action(action_stack.pop_back())

func _push_stack(action_arg):
	action_stack.push_back(action_arg)

func activate_action_stack():
	while action_stack.empty()==false:
		_pop_stack()

func _increment_return_count():
	return_count+=1
