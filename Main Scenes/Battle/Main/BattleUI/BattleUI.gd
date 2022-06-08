extends Control

var output
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


func get_user_input(character):
	var user_input=yield($BottomBar.get_user_input(),"completed")
	
	return user_input

func test_message():
	var tm=$MessageUI.activate_message_box("Test Message")
	if tm is GDScriptFunctionState: # Still working.
		tm = yield(tm,"completed")


func activate():
	pass

func deactivate():
	pass

func get_output():
	
	return output


