extends Control

var return_action:BattleAction
signal end_message
#action components
func _init():
	Signals.battle.connect("position_selected",self,"test")
	
func _initialise():
	pass

func _notification(what):
	match what:
		NOTIFICATION_PARENTED:
			if get_parent().name=="root":
				print("Get Test Data "+self.name)
				_initialise()
	
func _request_action(actor,function:FuncRef):
	var action:BattleAction
	return_action=null
	$BottomBar.set_state($BottomBar.state_def.GET_ACTION)
	
	while return_action==null:
		pass
	
	action=return_action
	return_action=null
	function.call_func(action)


func _set_return_action(action_arg):
	return_action=action_arg

func get_user_input(character):
	var user_input=yield($BottomBar.get_user_input(),"completed")
	
	return user_input

func process_action(action:BattleAction):

	match action.type:
		action.type_def.SKILL:
			yield($MessageUI.activate_message_box(action.get_skill_message()),"completed")
		action.type_def.DEATH:
			yield($MessageUI.activate_message_box("Character has died!"),"completed")


func test_message():
	var tm=$MessageUI.activate_message_box("Test Message")
	if tm is GDScriptFunctionState: # Still working.
		tm = yield(tm,"completed")
