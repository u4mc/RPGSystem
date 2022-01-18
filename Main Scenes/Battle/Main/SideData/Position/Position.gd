extends Node


class_name Character
#char data
#pull from tres or pushed data
var character_class:Resource
var character_data:Resource

var character_status=load("res://Main Scenes/Battle/Main/SideData/Position/CharacterStatus.gd").new()
var character_ai=load("res://Main Scenes/Battle/Main/SideData/Position/CharacterAI.gd").new()
var character_animation=load("res://Main Scenes/Battle/Main/SideData/Position/CharacterAnimation.gd").new()
var skill_list

var side
var controllable
var active=false

var initiative:float
var control_action=null

signal show_detail
signal hide_detail
onready var tween=$Tween
func get_data():
	return character_data

func get_name():
	return character_data.name

func get_position():
	return character_data.position
func get_controllable_action():
	control_action=null
	Signals.battle.emit_signal("request_control_action")
	while control_action==null:
		pass
	return control_action

func get_action():
	if controllable==true:
		#return null
		pass
	return character_ai.get_action(skill_list,side,self)

func get_active():
	return active
func get_start_of_round_action():
	return null
func _is_damaged():
	$Sprite.self_modulate="ff8383"

func is_active():
	$ActiveBase.visible=true

func is_not_active():
	$ActiveBase.visible=false

func activate():
	$Base.activate()
	active=true

func _deactivate():
	active=false
	$Sprite.visible=false

func _destroy():
	active=false
	character_data=null
	$Sprite.texture=null

func _on_death():
	_deactivate()

func play_animation(animation:String,args):
	character_animation.play(animation,args)

func die():
	_on_death()
	Signals.terminal.emit_signal("out",get_name()+" has died!")
func roll_initiative():
	initiative=character_data.speed*Rng.rng.randf_range(0.5,1.5)
	return initiative

func _damage_effect(damage_value):
	character_data.lower_hp(damage_value)
	if character_data.current_hp==0:
		pass

func process_effect(battle_effect):
	match battle_effect.type:
		battle_effect.type_def.DAMAGE:
			_damage_effect(battle_effect.value)
			Signals.terminal.emit_signal("out",get_name()+" has taken "+ battle_effect.value as String+ " damage! Health is now "+character_data.get_current_hp() as String)
			if _check_has_died():
				var death_action=BattleAction.new()
				death_action.set_death_action(self)
				Signals.battle.emit_signal("push_action_stack",death_action)

func _check_has_died():
	if character_data.get_current_hp()==0:
		return true
	else:
		return false

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
	if(side=="PlayerSide"):
		controllable=true
	connect("show_detail",$Detail,"_show_detail")
	connect("hide_detail",$Detail,"_hide_detail")
	Signals.data.emit_signal("request_side_data",self)


func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton&&event.pressed:
		match event.button_index:
			BUTTON_LEFT:
				Signals.battle.emit_signal("position_selected",self)
			BUTTON_RIGHT:
				emit_signal("show_detail")


func _on_Area2D_mouse_exited():
	emit_signal("hide_detail")



func _on_Button_pressed():
	
	tween.interpolate_property($Sprite,"modulate",Color(1, 1, 1, 1), Color(1, 1, 1, 0),1,Tween.TRANS_LINEAR, Tween.EASE_IN)
	var t=tween.start()
	yield(t,"tween_completed")


func _on_Button2_pressed():
	tween.interpolate_property($Sprite,"modulate",Color(1, 1, 1, 0),Color(1, 1, 1, 1) ,1,Tween.TRANS_LINEAR, Tween.EASE_IN)
	tween.start()
