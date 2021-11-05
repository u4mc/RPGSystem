extends Container



onready var name_label=get_node("Panel/VBoxContainer/HBoxContainer/RichTextLabel")

export var char_name:String

# Called when the node enters the scene tree for the first time.
func _ready():
	name_label.text=char_name
	pass # Replace with function body.

func initialise(player_data_arg):
	set_name(player_data_arg.name)

func set_name(arg:String):
	name_label.text=arg
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
