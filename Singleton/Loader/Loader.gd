extends Node

var side_data

func load_menu(menu_name:String):
	#get menu script
	var menu=load("res://Sub Scenes/UI/Menu/"+menu_name+"/"+menu_name+".tscn")
	if menu:
		print("Valid menu")
		return menu
	print("Invalid menu")
	return

func get_side_data():
	return side_data

func set_side_data(side_data_arg):
	side_data=side_data_arg
