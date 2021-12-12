extends Node

var turn_order:Array

func _init():
	Signals.battle.connect("start_round",self,"_round")


func _round():
	Signals.terminal.emit_signal("out","Round start")
	request_turn_order()
	#get start of round actions
	process_start_of_round_actions()
	#get action from each character
	process_round()

func process_round():
	for character in turn_order:
		var current_action=character.get_action()
		Signals.battle.emit_signal("push_action_stack",current_action)
		$ActionStack.activate_action_stack()

func process_start_of_round_actions():
	for character in turn_order:
		var current_action=character.get_start_of_round_action()
		if current_action!=null:
			Signals.battle.emit_signal("push_action_stack",current_action)
	$ActionStack.activate_action_stack()

func request_turn_order():
	Signals.data.emit_signal("request_turn_order",funcref(self,"set_turn_order"))

func set_turn_order(turn_order_arg):
	turn_order=turn_order_arg

func _initialise():
	pass
