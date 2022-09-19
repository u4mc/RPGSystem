extends Node
export(Resource)var TEST_character_data
export(String,"PlayerSide","EnemySide")var TEST_side
export(bool)var TEST_invert
#char data
#pull from tres or pushed data
var character_data

var character_status=load("res://Main Scenes/Battle/Main/SideData/Position/CharacterStatus.gd").new()
var character_ai=load("res://Main Scenes/Battle/Main/SideData/Position/CharacterAI.gd").new()
var character_animation=load("res://Main Scenes/Battle/Main/SideData/Position/CharacterAnimation.gd").new()

var side
var controllable

var invert

var active=false
var targetable=false

var initiative:float
var control_action=null

signal show_detail
signal hide_detail

signal selected

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
		return
	return character_ai.get_action()

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

func play_animation(animation:String):
	#character_animation.play(animation)
	$AnimationPlayer.play(animation)

func death():
	var a=$AnimationPlayer.play("death")
	
func roll_initiative():
	initiative=character_data.speed*Rng.rng.randf_range(0.5,1.5)
	return initiative

func _damage_effect(damage_value):
	character_data.lower_hp(damage_value)
	$HPValue.text=str(character_data.current_hp)+"/"+str(character_data.max_hp)
	if character_data.current_hp==0:
		var death_act = Action.Death.new()
		death_act.position=self
		Signals.battle.emit_signal("push_action_stack",death_act)
	
func get_damage():
	#get raw damage from character data
	return character_data.get_weapon_attack()

func _check_has_died():
	if character_data.get_current_hp()==0:
		return true
	else:
		return false
func set_state(state:String):
	match state:
		"targeting":
			$Base/TargetedBase.visible=true
		"targetable":
			$Base.color="76ff0000"
		"targeted":
			pass
func set_state_off(state:String):
	match state:
		"targeting":
			$Base/TargetedBase.visible=false
		"targetable":
			$Base.color="71ffffff"
		"targeted":
			$Base.color="71ffffff"

func apply_effect(effect_arg):
	_damage_effect(effect_arg.damage)
	
func _notification(what):
	match what:
		NOTIFICATION_PARENTED:
			if get_parent().name=="root":
				print("Get Test Data "+self.name)
				#var data=load(TestData.test_character)
				self.position.x=922.971
				self.position.y=552.357
				$Test.visible=true
				_initialise(TEST_character_data,TEST_side,TEST_invert)


func _initialise(character_data_arg,side_arg,invert_arg):
	activate()
	character_data=character_data_arg
	side=side_arg
	invert=invert_arg
	$Sprite.texture=character_data.sprite_texture
	if(side=="EnemySide"):
		#$Sprite.flip_h=true
		pass
	if(side=="PlayerSide"):
		controllable=true
	if invert:
		$Sprite.flip_h=true
	connect("show_detail",$Detail,"_show_detail")
	connect("hide_detail",$Detail,"_hide_detail")
	$HPValue.text=str(character_data.current_hp)+"/"+str(character_data.max_hp)
	Signals.data.emit_signal("request_side_data",self)


func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton&&event.pressed:
		match event.button_index:
			BUTTON_LEFT:
				if active:
					emit_signal("selected",self)
				#send signal to menu
			BUTTON_RIGHT:
				emit_signal("show_detail")



func set_targetable():
	
	print("Targetable")

func set_targeted():
	$Base/TargetedBase.visible=true

func set_active():
	pass

func _on_Area2D_mouse_exited():
	emit_signal("hide_detail")



func _on_Anim1_pressed():
	$AnimationPlayer.play("damage")


func _on_Anim2_pressed():
	$AnimationPlayer.play("attack")


func _on_Anim3_pressed():
	$AnimationPlayer.play("death")


func _on_SetActive_pressed():
	set_active()


func _on_SetTargetable_pressed():
	set_targetable()


func _on_Area2D_mouse_entered():
	#if targetable = true emit signal sending info to menu
	pass # Replace with function body.


func _on_SetTargeted_pressed():
	set_targeted()
