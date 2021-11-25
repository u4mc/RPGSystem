extends Node


func _init():
	Signals.data.connect("request_turn_order",self,"_request_turn_order")
	

func _damage_character(side,position,damage_value):
	get_node(side)._damage_character(position,damage_value)

func _sort_initiative(a,b):
	if a.initiative > b.initiative:
		return true
	return false

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
	
	

func get_turn_order():
	#Turn order:Array of active position nodes
	var turn_order:Array
	turn_order.append_array($PlayerSide.get_all_character())
	turn_order.append_array($EnemySide.get_all_character())
	return turn_order

func _request_turn_order(req_node:Node):
	
	req_node.set_turn_order(get_turn_order())
