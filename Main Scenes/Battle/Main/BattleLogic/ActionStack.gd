extends Node

var action_stack:Array

var battle_system

func _init():
	Signals.battle.connect("push_action_stack",self,"push_stack")



func pop_stack():
	return action_stack.pop_back()

func push_stack(action_arg):
	action_stack.push_back(action_arg)

func activate_action_stack():
	while action_stack.empty()==false:
		pop_stack()
