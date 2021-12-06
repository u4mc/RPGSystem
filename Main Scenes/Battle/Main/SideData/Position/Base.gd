extends Polygon2D


const active_colour="71ffffff"
const inactive_color="17ffffff"

signal show_detail
signal hide_detail
# Called when the node enters the scene tree for the first time.

func activate():
	self.color=active_colour


func _on_Area2D_mouse_entered():
	self.self_modulate="62ff00"
	#emit_signal("show_detail")


func _on_Area2D_mouse_exited():
	self.self_modulate="ffffff"
	#emit_signal("hide_detail")



#func _on_Area2D_input_event(viewport, event, shape_idx):
#	if event.pressed and event.button_index == BUTTON_RIGHT:
#		emit_signal("show_detail")
