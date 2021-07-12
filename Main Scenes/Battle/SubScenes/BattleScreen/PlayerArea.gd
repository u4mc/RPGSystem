extends Control
var player_data_slot=preload("res://Main Scenes/Battle/SubScenes/BattleScreen/PlayerDataSlot/PlayerDataSlot.tscn")

onready var players=[]
onready var enemies=[]
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():

	pass # Replace with function body.

func _populatePlayers(playerList):
	for player in playerList:
		_add_player(player)

func _add_player(p):
	var player=_create_instance(_get_player_node(p.coord))
	return player

func _create_instance(node):
	#create and populate instance
	var instance=player_data_slot.instance()
	node.add_child(instance)
	return instance

func _get_player_node(coord):
	return get_node("p"+str(coord[0])+str(coord[1]))
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
