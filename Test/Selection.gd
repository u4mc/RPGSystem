extends Control

onready var button1=$VBoxContainer/Button1
onready var button2=$VBoxContainer/Button2

var output

func _ready():
	self.visible=false

func _on_Button1_pressed():
	output=1


func _on_Button2_pressed():
	output=2


func activate():
	self.visible=true
	print("Activate selection")

func deactivate():
	print("Deactivate selection")
	output=null
	self.visible=false

func get_output():
	
	return output
	
