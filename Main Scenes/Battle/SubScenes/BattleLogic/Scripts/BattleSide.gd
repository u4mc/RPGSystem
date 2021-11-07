extends Node

var characters:Array
#character node

func initialise(var side_data):
	#get character data from passed array, copy to players
	characters=side_data


func get_initiative():
	
	var char_initative=characters
	return char_initative
