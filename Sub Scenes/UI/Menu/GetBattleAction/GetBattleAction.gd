extends MarginContainer

var character_pos
var get_action_type=preload("res://Sub Scenes/UI/Component/GetActionType/GetActionType.tscn")
var get_attack=preload("res://Sub Scenes/UI/Component/GetAttack/GetAttack.tscn")
var side_data
var menu_stack:Array

var output

signal complete

#func _notification(what):
#	match what:
#		NOTIFICATION_PARENTED:
#			if get_parent().name=="root":
#				print("Get Test Data "+self.name)
#				_initialise(load("res://Resources/test/character/Murasaki.tres"),"")

func _initialise(character_pos_arg,side_data_arg):
	character_pos=character_pos_arg
	side_data=side_data_arg
	character_pos.set_state("targeting")
	_push_menu_stack(get_action_type,"")

func _menu_change(menu:String,arg):
	#handle menu and send appropriate arg
	print("menu change")
	match menu:
		"Attack":
			_push_menu_stack(get_attack,character_pos.character_data.get_attack_list())
#		"Magic":
#			_push_menu_stack(get_attack,character_pos.character_data.get_magic_list())
#		"Skill":
#			_push_menu_stack(get_attack,character_pos.character_data.get_skill_list())


func _push_menu_stack(menu,arg):
	if menu_stack.size()>0:
		remove_child(menu_stack.back())
	
	menu_stack.push_back(menu.instance())
	menu_stack.back()._initialise(arg,side_data,character_pos)
	menu_stack.back().connect("menu_change",self,"_menu_change")
	menu_stack.back().connect("confirm",self,"_on_confirm")
	#,[menu_stack.back().output]
	add_child(menu_stack.back())
	

func _pop_menu_stack():
	if menu_stack.size()==1:
		return
	remove_child(menu_stack.pop_back())
	add_child(menu_stack.back())
	
func _on_confirm(out):
	output=out
	print("complete")
	emit_signal("complete")

func finish():
	for m in menu_stack:
		m.finish()
	character_pos.set_state_off("targeting")
	self.queue_free()
	

func _on_Back_pressed():
	_pop_menu_stack()
