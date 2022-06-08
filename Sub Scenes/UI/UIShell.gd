extends Control

signal confirm

var components:Array#array of scenes

func initialise():
	#override if any components require arguments
	#set confirm
	for c in components:
		c.connect("confirm",self,"_on_Confirm_pressed")
	#return components for parenting
	return components

func activate():
	#override if alt behavior needed
	#always return output
	var output
	#activate children
	for c in components:
		c.activate()
	yield(self,"confirm")
	return output

func _on_Confirm_pressed():
	#link all confirm buttons to this
	#get output from all children
	#perform checks, return if fail
	#on success package, deactivate children and return
	for c in components:
		c.deactivate
	pass
