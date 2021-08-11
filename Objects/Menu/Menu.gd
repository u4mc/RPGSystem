extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var menu_options
#Array of menu option objects
var linked_script
#linked gd script that contains behaviour eg: debug menu script/battle menu script
var cell_dimensions
#size of cells for menu
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func initMenu():
	pass


#todo
#Array of menu options
#Get option size from given menu option
#slot in from menu option size * position
#linked script contains behaviour for every menu option

#json init requires cell size, text size and linked script


class menu_option:
	extends Control
	
	var base = Control.new()
	var richText: Node= RichTextLabel.new()
	var cell= Node2D.new()
	var linked_function
	
	func _init(text):
		richText.text=text
		
		
