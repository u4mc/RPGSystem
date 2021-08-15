extends Node


onready var base = get_node(".")
onready var panel = get_node("Panel")
onready var text = get_node("Panel/RichTextLabel")

signal s

func _init(var txt, var locationX,locationY, var sizeX, var sizeY):
	text.text=txt
	base.rect_position.x=locationX
	base.rect_position.y=locationY
	pass

func onclick():
	pass
