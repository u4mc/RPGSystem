extends Control

var menu_options
#Array of menu option objects
var linked_script
#linked gd script that contains behaviour eg: debug menu script/battle menu script
var cell_dimensions
#size of cells for menu
# Called when the node enters the scene tree for the first time.

onready var menu_node =get_node(".")

onready var rect = get_node("Panel")

var menu_slot = preload("res://Objects/Menu/Menu_Slot.tscn")

func _ready():
	
	pass # Replace with function body.

func initMenu():
	pass

func initSlot():
	var slot=menu_slot.instance()._init()

#todo
#Array of menu options
#Get option size from given menu option
#slot in from menu option size * position
#linked script contains behaviour for every menu option

#json init requires cell size, text size and linked script
