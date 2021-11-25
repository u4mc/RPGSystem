extends Node

#char data
#pull from tres or pushed data
var character_class:Resource
var character_data:Resource

var skill_list=load("res://Main Scenes/Battle/SubScenes/Skill/SkillList.gd").new()
var character_status=load("res://Main Scenes/Battle/SubScenes/Char/CharacterStatus.gd").new()
var character_ai=load("res://Main Scenes/Battle/SubScenes/Char/CharacterAI.gd").new()
var CharacterAction=load("res://Main Scenes/Battle/SubScenes/Char/CharacterAction.gd")

var initiative:float

signal is_dead
signal skill
signal get_input

signal action(actor,target,skill)


var side:String
var opposing_sides:Array

#skills
#could potentially get skills from filename, array of filenames

#ai
#ai should be attached if necessary. Basic ai script chooses moves at random
#Should be overriden by control if necessary

#side
#selects if ally or enemy



func get_action():
	var character_action=CharacterAction.new()
	character_action.actor=self
	if character_ai!=null:
		return character_action

func get_name():
	return character_data.name

func get_position():
	return character_data.position

func change_health():
	#Respond to health modification signal
	#Modify health
	#Check if dead, send dead signal if so
	pass
	
func is_damaged():
	$Sprite.self_modulate="ff8383"

func roll_initiative():
	initiative=character_data.speed*(randf()+1)
	return initiative
	
func use_skill():
	#Access skill list
	#Send signal down to be processed
	pass
	
func set_side_data(var side_arg,var opposing_sides_arg):
	#access through signal
	side=side_arg
	opposing_sides=opposing_sides_arg

func test_func():
	print("Signal test successful")
	
func _ready():
	add_to_group("characters")
	
	

func _notification(what):
	match what:
		NOTIFICATION_PARENTED:
			if get_parent().name=="root":
				print("Get Test Data "+self.name)
				var data=load(TestData.test_character)
				_initialise(data)

func _initialise(character_data_arg):

	character_data=character_data_arg
	$Sprite.texture=character_data.sprite_texture
