extends Node2D

onready var textLabel=get_node("Container/RichTextLabel")

func get_text(var text):
	#gets text from input
	textLabel.text=text


func advance():
	#advances text when stopped. Auto terminates when no more text can be found
	pass
	
func purge():
	#purges text area
	pass


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
