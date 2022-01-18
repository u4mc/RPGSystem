extends Control

var button_type

signal highlight(button)
signal mouse_off
signal left_click(button)
signal right_click(button)

var button_title=""
var button_description="Sample Description"


func initialise(title_arg,description_arg):
	button_title=title_arg
	button_description=description_arg


func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton&&event.pressed:
		match event.button_index:
			BUTTON_LEFT:
				emit_signal("left_click",self)
			BUTTON_RIGHT:
				emit_signal("right_click",self)


func _on_Area2D_mouse_entered():
	emit_signal("highlight",self)


func _on_Area2D_mouse_exited():
	#emit_signal("mouse_off")
	pass
