extends Node
var a
func _init():
	pass
	
func _notification(what):
	match what:
		NOTIFICATION_PARENTED:
			if get_parent().name=="root":
				print("Get Test Data "+self.name)
				_initialise(load("res://Resources/test/battle/TestBattle.tres"))

func _initialise(var battle_arg):
	print(battle_arg)
	$SideData._initialise(battle_arg.player_side,battle_arg.enemy_side)
	$Background._initialise()
	$BattleLogic._initialise()
	
	Signals.battle.emit_signal("start_round")
	#Signals.terminal.emit_signal("clear")
