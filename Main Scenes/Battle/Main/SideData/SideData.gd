extends Node


func _init():
	Signals.data.connect("request_turn_order",self,"_request_turn_order")
	Signals.data.connect("request_opposite_side",self,"_request_opposite_side")
	Signals.data.connect("request_side",self,"_request_side")
	Signals.battle.connect("emit_battle_action",self,"_on_battle_action_emit")

func _notification(what):
	match what:
		NOTIFICATION_PARENTED:
			if get_parent().name=="root":
				print("Get Test Data "+self.name)
				var data=load(TestData.test_battle)
				_initialise(data.player_side,data.enemy_side)
				

func _initialise(player_side_arg:Array,enemy_side_arg:Array):
	$PlayerSide._initialise(player_side_arg)
	$EnemySide._initialise(enemy_side_arg)
	

func _request_turn_order(function_ref:FuncRef):
	function_ref.call_func(get_turn_order())

func _request_side(function_ref:FuncRef,side:String):
	function_ref.call_func(get_side(side))

func _request_opposite_side(function_ref:FuncRef,side:String):
	var opposing_side=get_opposite_side(side)
	function_ref.call_func(opposing_side)

func get_side(side:String):
	return get_node(side)

func get_opposite_side(side:String):
	if side=="PlayerSide":
		return $EnemySide
	if side=="EnemySide":
		return $PlayerSide

func get_turn_order():
	#Turn order:Array of active position nodes
	var turn_order:Array
	turn_order.append_array($PlayerSide.get_all_character())
	turn_order.append_array($EnemySide.get_all_character())
	
	for character in turn_order:
		character.roll_initiative()
	turn_order.sort_custom(self,"_sort_initiative")
	return turn_order

func _sort_initiative(a,b):
	if a.initiative > b.initiative:
		return true
	return false
func _check_if_all_dead():
	if $PlayerSide.check_if_all_dead():
		return $PlayerSide
	if $EnemySide.check_if_all_dead():
		return $EnemySide
	return null
func _on_battle_action_emit(battle_action:BattleAction):
	match battle_action.type:
		battle_action.type_def.SKILL:
			_on_skill_action(battle_action)
		battle_action.type_def.DEATH:
			_on_death_action(battle_action)
	
func _on_skill_action(battle_action:BattleAction):
	_process_effects(battle_action.get_battle_effects())

func _on_death_action(battle_action:BattleAction):
	battle_action.target.die()
	#check if all characters are dead
	if _check_if_all_dead()!=null:
		#add END action to stack
		var end_action=BattleAction.new()
		end_action.set_end_action(null)
		Signals.battle.emit_signal("push_action_stack",end_action)
		
func process_action(action):
	_on_battle_action_emit(action)

func _process_effects(battle_effects:Array):
	for battle_effect in battle_effects:
		var target=battle_effect.target
		target.process_effect(battle_effect)
