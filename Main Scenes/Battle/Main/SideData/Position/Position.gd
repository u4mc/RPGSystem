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

func get_data():
	return character_data

func get_name():
	return character_data.name

func get_position():
	return character_data.position

func get_action():
	print("Get Action")
	var action=character_ai.get_action(skill_list,side,self)
	return action

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

func _on_death():
	pass

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
			if _check_has_died()==true:
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
	
	Signals.data.emit_signal("request_side_data",self)
