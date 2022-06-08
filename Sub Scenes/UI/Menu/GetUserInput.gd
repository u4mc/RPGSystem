extends Reference

var components:Array#array of scenes

var get_battle_action=preload("res://Sub Scenes/UI/Component/GetBattleAction/GetBattleAction.tscn").instance()
var side_data
signal confirm

func activate():
	#override if alt behavior needed
	#always return output
	var output
	#activate children
	get_battle_action.activate()
	yield(self,"confirm")
	return output

func _on_Confirm_pressed():
	print("get user input output")
	#link all confirm buttons to this
	#get output from all children
	var out=get_battle_action.output
#	if out==null:
#		return
	#perform checks, return if fail
	#on success package, deactivate children and return
	#emit_signal("confirm")

func initialise(character_data,side_data_arg):
	#override if any components require arguments
	#side_data=side_data_arg
	get_battle_action._initialise(character_data)
	#set confirm
	get_battle_action.connect("confirm",self,"_on_Confirm_pressed")
	#return components for parenting
	components.append(get_battle_action)
	return components
