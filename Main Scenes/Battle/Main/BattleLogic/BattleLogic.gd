extends Node

var turn_order:Array
#var battle_end:bool
func _init():
	pass
#	Signals.battle.connect("start_round",self,"_round")
func _initialise():
	pass
func pop_turn_stack():
	if turn_order.empty()!=true:
		return turn_order.pop_front()
	return null

func push_action_stack(action):
	print("Push Stack")
	$ActionStack.push_stack(action)

func pop_action_stack():
	#Returns null if no action can be found
	return $ActionStack.pop_stack()

func resolve_action(action_arg):
	match action_arg.type:
		action_arg.type_def.SKILL:
			action_arg.set_battle_effects($BattleSystem.resolve_skill(action_arg.get_skill()))
			#Signals.battle.emit_signal("resolve_skill",action_arg.get_skill(),funcref(action_arg,"set_battle_effects"))
		action_arg.type_def.DEATH:
			pass
		action_arg.type_def.END:
			pass
	return action_arg

func set_turn_order(turn_order_arg):
	turn_order=turn_order_arg




func process_start_of_round_actions():
	for character in turn_order:
		var current_action=character.get_start_of_round_action()
		if current_action!=null:
			Signals.battle.emit_signal("push_action_stack",current_action)
	$ActionStack.activate_action_stack()

#func request_turn_order():
#	Signals.data.emit_signal("request_turn_order",funcref(self,"set_turn_order"))
#enum round_state_def{START,IDLE,PROCESSING}
#var round_state=round_state_def.START
#
#func _advance():
#	if round_state==round_state_def.PROCESSING:
#		return
#	match round_state:
#		round_state_def.START:
#			pass
#
#func _round():
#	if battle_end==true:
#		return
#	Signals.terminal.emit_signal("out","Round start")
#	request_turn_order()
#	#get start of round actions
#	process_start_of_round_actions()
#	#get action from each character
#	process_round()
#
#func process_round():
#	for character in turn_order:
#		if character.get_active()==false:
#			continue
#		var current_action=character.get_action()
#		if current_action==null:
#			continue
#		Signals.battle.emit_signal("push_action_stack",current_action)
#		if $ActionStack.activate_action_stack():
#			Signals.terminal.emit_signal("out","Battle has finished!")
#			break
