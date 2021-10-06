extends Node
#Store all character nodes here
#On init use signal to init UI information

var players:Array
#character nodes

func initialise(var player_side_data):
	#get character data from passed array, copy to players
	players=player_side_data.character
	print(players[0].Name)
	#send signal to UI
	
	pass
