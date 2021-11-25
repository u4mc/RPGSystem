extends Node

func _init():
	Signals.Battle.connect("is_dead",self,"_is_dead")
	
func _notification(what):
	match what:
		NOTIFICATION_PARENTED:
			if get_parent().name=="root":
				print("Get Test Data "+self.name)
				_initialise(load(TestData.test_battle))

func _initialise(var battle_arg):
	$SideData._initialise(battle_arg.player_side,battle_arg.enemy_side)
	$Background._initialise()
	$BattleLogic._initialise()
	Signals.get("terminal").emit_signal("out","Terminal Test Output")
	Signals.Battle.emit_signal("start_round")
	#Signals.terminal.emit_signal("clear")

func _is_dead(character):
	print(character.get_name()+" is dead")
