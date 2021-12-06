extends Node

var turn_order:Array

var side_data_ref:Node
func _init():
	Signals.battle.connect("start_round",self,"_round")


func _round():
	Signals.terminal.emit_signal("out","Round start")
	request_turn_order()
	#get start of round actions
	for character in turn_order:
		pass
	#get action from each character
	for character in turn_order:
		var current_action=character.get_action()
		$EventStack.process_action(current_action)
		pass
		#battle process fires signals

func pop_turn_order():
	pass
	
func pop_action_stack():
	pass
func get_start_of_round_actions():
	pass

func request_turn_order():
	Signals.data.emit_signal("request_turn_order",funcref(self,"set_turn_order"))

func set_turn_order(turn_order_arg):
	turn_order=turn_order_arg

func _initialise():
	pass
