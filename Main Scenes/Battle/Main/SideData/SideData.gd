extends Node


enum state{INACTIVE,SELECT_TARGET}

var turn_order:Array
var action_stack:Array

func _notification(what):
	match what:
		NOTIFICATION_PARENTED:
			if get_parent().name=="root":
				print("Get Test Data "+self.name)
				var data=load(TestData.test_battle)
				_initialise(data.player_side,data.enemy_side)
				

func _initialise(player_side_arg:Array,enemy_side_arg:Array):
	$PlayerSide._initialise(player_side_arg,false)
	$EnemySide._initialise(enemy_side_arg,true)
	Signals.battle.connect("push_action_stack",self,"push_action_stack")

func get_side(side:String):
	return get_node(side)

func get_opposite_side(side):
	if side==$PlayerSide:
		return $EnemySide
	if side==$EnemySide:
		return $PlayerSide

func _get_target_side(position:Node,target):
	match target:
		"Ally":
			return _get_position_side(position)
		"Enemy":
			return get_opposite_side(_get_position_side(position))

func _get_position_side(position:Node):
	var side:Node
	for p in $PlayerSide.get_all_character():
		if p==position:
			return $PlayerSide
	for p in $EnemySide.get_all_character():
		if p==position:
			return $EnemySide

func get_valid_targets(position:Node,attack:Attack):
	var valid_targets:Array
	var valid_columns:Array=attack.valid_target
	var test=attack.target_side
	var target_side=_get_target_side(position,attack.target_side)
	for n in 2:
		if valid_columns[n]:
			valid_targets.append(target_side.get_all_character_from_row(n))
	return valid_targets

func set_turn_order():
	#Turn order:Array of active position nodes
	turn_order.append($PlayerSide.get_all_character())
	turn_order.append($EnemySide.get_all_character())
	breakpoint
	for character in turn_order:
		character.roll_initiative()
	turn_order.sort_custom(self,"_sort_initiative")

func pop_turn_stack():
	return turn_order.pop_front()

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

func death(position):
	#search both sides
	turn_order.erase(position)
	if $PlayerSide.death(position):
		return
	if $EnemySide.death(position):
		return

func check_side_loss():
	if $PlayerSide.check_if_all_dead():
		return "defeat"
	if $EnemySide.check_if_all_dead():
		return "victory"
	return null

func _get_side_from_position(position):
	pass
func pop_action_stack():
	return action_stack.pop_back()

func push_action_stack(action_arg):
	print("push action stack")
	action_stack.append(action_arg)
