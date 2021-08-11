extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var base = get_node(".")
var richText: Node= RichTextLabel.new()
var cell= Node2D.new()


# Called when the node enters the scene tree for the first time.
func _ready():
	richText.text="Generic Text"
	cell.add_child(richText)
	base.add_child(cell)
	pass # Replace with function body.


func _on_click():
	#on click run the on_click function from the linked script
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
