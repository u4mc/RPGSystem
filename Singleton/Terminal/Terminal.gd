extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time


func _on_TerminalIn_text_entered(new_text):
	print("Signal "+new_text)
	#$TerminalOut._new_line("text"+new_text)
	#emit_signal(new_text)

func _input(event):
	if event is InputEventKey and event.pressed:
		if event.scancode == KEY_TAB:
			if self.visible==true:
				self.visible=false
			else:
				if self.visible==false:
					self.visible=true

func _init():
	pass
	
