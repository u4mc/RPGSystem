extends Node

onready var battle_logic=get_node("BattleLogic")
#onready var battle_screen=get_node("BattleScreen")
onready var enemy_side=get_node("EnemySide")
onready var UI=get_node("UI")

#TEST DATA
var test_data=load("res://Resources/test/battle/TestBattle.tres")
var test_flag=1
# Storage for battle objects

# Called when the node enters the scene tree for the first time.
func _ready():
	if(test_flag==1):
		initialise(test_data)

func initialise(var battle_data):
	UI.initialise(battle_data.get_player_side())
	enemy_side.initialise(battle_data.get_enemy_side())
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
