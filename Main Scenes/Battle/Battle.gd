extends Node

onready var battle_logic=get_node("BattleLogic")
onready var battle_screen=get_node("BattleScreen")
onready var enemy_side=get_node("EnemySide")
onready var UI=get_node("UI")

#TEST DATA
var test_data=load("res://Resources/test/battle/TestBattle.tres")
# Storage for battle objects

# Called when the node enters the scene tree for the first time.
func _ready():
	var battle_data
	if(battle_data==null):
		battle_data=test_data
		UI.initialise(battle_data.player_side)
	pass # Replace with function body.

func initialise(var battle_data):
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
