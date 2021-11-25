extends Node

var turn_order:Array

var side_data_ref:Node
func _init():
	Signals.Battle.connect("start_round",self,"_round")

func _initialise():
	pass

func _round():
	Signals.terminal.emit_signal("out","Round start")
	request_turn_order()
	#roll initiative and sort
	roll_initiative()
	#get start of round actions
	$EventStack.process_action(get_start_of_round_actions())
	#get action from each character
	for character in turn_order:
		$EventStack.process_action(character.get_action())
		#$ActionStack.init_stack()
		#yield($ActionStack,"empty_stack")
		pass
		#battle process fires signals

func pop_turn_order():
	pass
	
func pop_action_stack():
	pass
func get_start_of_round_actions():
	pass
func roll_initiative():
	for character in turn_order:
		character.roll_initiative()
		
	turn_order.sort_custom(self,"_sort_initiative")

func _sort_initiative(a,b):
	if a.initiative > b.initiative:
		return true
	return false

func request_turn_order():
	Signals.data.emit_signal("request_turn_order",self)
	while(turn_order==null):
		print("Delay")

func set_turn_order(turn_order_arg):
	turn_order=turn_order_arg

