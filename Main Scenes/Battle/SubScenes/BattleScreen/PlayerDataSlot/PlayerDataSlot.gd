extends Control

onready var player_data_slot=get_node(".")
onready var player_name=get_node("LeftArea/Control/Name")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.

func init(var p_name):
	player_name.text=p_name
	pass
func _ready():

	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
