extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Position._initialise(load("res://Resources/test/character/Murasaki.tres"),"PlayerSide",false)
	$Position2._initialise(load("res://Resources/test/character/King.tres"),"EnemySide",true)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	#$Position/AnimationPlayer.play("attack")
	$AnimationPlayer.play("Attack_Placeholder")

