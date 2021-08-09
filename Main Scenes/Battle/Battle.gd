extends Node

onready var battle_logic=get_node("BattleLogic")
onready var battle_screen=get_node("BattleScreen")

var player =load("res://Main Scenes/Battle/Objects/Player.gd")
var enemy = load("res://Main Scenes/Battle/Objects/Enemy.gd")
var player_lineup=load("res://Main Scenes/Battle/Objects/Lineup.gd")
var enemy_lineup=load("res://Main Scenes/Battle/Objects/Lineup.gd")
# Storage for battle objects
var players=player_lineup.new(3)
#var enemies=enemy_lineup.new()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func init():
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
