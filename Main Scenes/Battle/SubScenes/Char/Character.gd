extends Node



#char data
#pull from tres or pushed data
var character_data:Resource


#char status
#represents data that is modified within battle
onready var character_status=get_node("Status")

signal is_dead

signal skill
#skills
#could potentially get skills from filename, array of filenames

#ai
#ai should be attached if necessary. Basic ai script chooses moves at random
#Should be overriden by control if necessary

#side
#selects if ally or enemy

func initialise(var character_data_arg:Resource, var character_status_arg):
	#use to init character
	character_data=character_data_arg
	character_status.initialise(character_status_arg)

func get_hp():
	pass

func change_health():
	#Respond to health modification signal
	#Modify health
	#Check if dead, send dead signal if so
	pass
	
func use_skill():
	#Access skill list
	#Send signal down to be processed
	pass
