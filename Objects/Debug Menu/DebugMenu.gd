extends CenterContainer

#Use buttons to set up given scenes
#On click set root scene as given scene, passing required arguments through this script
#Find some way to overlay debug menu anywhere

var next_scene


func _on_Button_pressed():
	get_tree().quit()


func _on_StartButton_pressed():
	get_tree().change_scene("res://Main Scenes/Battle/Battle.tscn")
	pass # Replace with function body.
