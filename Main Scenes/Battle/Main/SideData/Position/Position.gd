extends Node


class_name Character
#char data
#pull from tres or pushed data
var character_class:Resource
var character_data:Resource

var character_status=load("res://Main Scenes/Battle/Main/SideData/Position/CharacterStatus.gd").new()
var character_ai=load("res://Main Scenes/Battle/Main/SideData/Position/CharacterAI.gd").new()
var skill_list

var side
var active=false

var initiative:float


func get_name():
	return character_data.name

func get_position():
	return character_data.position

func get_action():
	print("Get Action")
	var action=character_ai.get_action(skill_list,side,self)
	return action

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
	initiative=character_data.speed*Rng.rng.randf_range(0.5,1.5)
	return initiative

func damage_event(damage_value):
	character_data.lower_hp(damage_value)
	if character_data.current_hp==0:
		pass

func process_event(battle_event):
	match battle_event.type:
		battle_event.type.DAMAGE:
			damage_event(battle_event.value)

func _notification(what):
	match what:
		NOTIFICATION_PARENTED:
			if get_parent().name=="root":
				print("Get Test Data "+self.name)
				var data=load(TestData.test_character)
				_initialise(data,"PlayerSide")


func _initialise(character_data_arg,side_arg):
	activate()
	character_data=character_data_arg
	$Sprite.texture=character_data.sprite_texture
	side=side_arg
	if(side=="EnemySide"):
		$Sprite.flip_h=true
	
	Signals.data.emit_signal("request_side_data",self)
