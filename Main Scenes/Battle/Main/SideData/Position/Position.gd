extends Node


class_name Character
#char data
#pull from tres or pushed data
var character_class:Resource
var character_data:Resource

var skill_list=load("res://Main Scenes/Battle/SubScenes/Skill/SkillList.gd").new()
var character_status=load("res://Main Scenes/Battle/SubScenes/Char/CharacterStatus.gd").new()
var character_ai=load("res://Main Scenes/Battle/SubScenes/Char/CharacterAI.gd").new()
var CharacterAction=load("res://Main Scenes/Battle/SubScenes/Char/CharacterAction.gd")

var active=false

var initiative:float

signal is_dead
signal skill
signal get_input

signal action(actor,target,skill)



func get_name():
	return character_data.name

func get_position():
	return character_data.position


func get_action():
	var character_action=CharacterAction.new()
	character_action.actor=self
	if character_ai!=null:
		return character_action
	else:
		#request character action (self, todo, todo)
		#send to UI
		return character_action
		
func damage_character(damage_value):
	Signals.terminal.emit_signal("out",self.get_name()+" has been damaged!")

func _is_damaged():
	$Sprite.self_modulate="ff8383"
	
func is_dead():
	Signals.Battle.emit_signal("is_dead",self)

func is_active():
	$ActiveBase.visible=true

func is_not_active():
	$ActiveBase.visible=false

func activate():
	$Base.activate()
	active=true
func roll_initiative():
	initiative=character_data.speed*(randf()+1)
	return initiative
	
func _notification(what):
	match what:
		NOTIFICATION_PARENTED:
			if get_parent().name=="root":
				print("Get Test Data "+self.name)
				var data=load(TestData.test_character)
				_initialise(data,"PlayerSide")

func _initialise(character_data_arg,side):
	activate()
	character_data=character_data_arg
	add_to_group(side)
	$Sprite.texture=character_data.sprite_texture
	if(side=="EnemySide"):
		$Sprite.flip_h=true

func _init():
	pass
