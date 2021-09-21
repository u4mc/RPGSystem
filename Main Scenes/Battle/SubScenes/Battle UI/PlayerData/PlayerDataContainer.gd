extends Container



onready var name_label=get_node("Panel/VBoxContainer/HBoxContainer/RichTextLabel")

export var char_name:String

# Called when the node enters the scene tree for the first time.
func _ready():
	name_label.text=char_name
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
