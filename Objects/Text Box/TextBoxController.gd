extends MarginContainer

onready  var container = get_node(".")

onready var title = get_node("VBoxContainer/MarginContainer/Label")

onready var text = get_node("VBoxContainer/MarginContainer2/Label")


func get_text(var text):
	#gets text from input
	pass

func advance():
	#advances text when stopped. Auto terminates when no more text can be found
	pass
	
func purge():
	#purges text area
	pass


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
