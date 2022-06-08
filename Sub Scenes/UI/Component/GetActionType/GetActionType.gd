extends VBoxContainer

signal menu_change(arg,arg2)
var side_data

func _initialise(arg,side_data_arg,character_pos):
	side_data=side_data_arg
	for b in $Buttons.get_children():
		b.connect("pressed", self, "_on_Button_pressed", [b.name])


func _on_Button_pressed(button_name):
	print(button_name)
	emit_signal("menu_change",button_name,"")

func _test(arg):
	print("test"+arg)

func finish():
	self.queue_free()
