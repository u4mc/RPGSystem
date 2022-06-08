extends HBoxContainer

var side_data
var char_side
var char_pos

var action
var valid_targets:Array
var selected_target

signal confirm(out)

func _initialise(action_array:Array,side_data_arg,char_pos_arg):
	#set action buttons
	for act in action_array:
		_init_action_button(act)
	side_data=side_data_arg
	char_pos=char_pos_arg

func _init_action_button(action_arg):
	var button=Button.new()
	#set properties
	button.text=action_arg.name
	button.margin_right=100
	button.margin_bottom=70
	button.rect_min_size.x=100
	button.rect_min_size.y=70
	button.connect("pressed", self, "_on_Button_pressed", [action_arg])
	$ActionSelect/Buttons.add_child(button)


func _set_detailed_info(action_arg):
	$ActionSelect/DetailedInfo/RichTextLabel.text=action_arg.name
	
func _on_Button_pressed(action_arg):
	print(action_arg.name)
	for target in valid_targets:
		#target.deactivate("target")
		target.disconnect("selected",self,"_on_select")
		#deactivate all old valid targets
	selected_target=null
	_set_detailed_info(action_arg)
	valid_targets=side_data.get_valid_targets(char_pos,action_arg)
	for target in valid_targets:
		target.set_state("targetable")
		target.connect("selected",self,"_on_select")
		#activate all valid targets
	action=action_arg


func _on_select(target):
	selected_target=target
	print("Selected")
	pass

func finish():
	
	self.queue_free()


func _on_Confirm_pressed():
	print("Confirm")
	#pass action down to scene root
	if action==null||selected_target==null:
		print("invalid output")
		return
	action.add_effect(char_pos,selected_target)
	for target in valid_targets:
		target.set_state_off("targetable")
	emit_signal("confirm",action)
