extends Node


var position_node = preload("res://Main Scenes/Battle/Main/SideData/Position/Position.tscn")
func get_random_target():
	#return character
	var targets=get_all_character()
	if targets.empty():
		return null
	return targets[Rng.rng.randi_range(0,targets.size()-1)]

func get_character(position:String):
	return get_node(position)

func get_all_character():
	#returns array of position nodes
	var characters:Array
	for column in self.get_children():
		for character in column.get_all_character():
			characters.append(character)
	return characters

func get_all_character_from_row(row:int):
	return get_node(str(row)).get_children()

func _init():
	pass

func _damage_character(position:String,damage_value:int):
	if get_node(position).active==true:
		get_node(position).damage_character(damage_value)

func check_if_all_dead():
	for c in get_all_character():
		if c.active==true:
			return false
	return true

func death(position):
	for col in self.get_children():
		if col.death(position):
			return true
	return false

func set_valid_targets(valid_targets:Array):
	#set valid row targets
	#arg array of bool
	for col in self.get_children:
		if valid_targets[col.name]:
			col.set_valid_targets()
	pass
func _initialise(var side_data_arg:Array,var invert:bool):
	for character_data in side_data_arg:
		get_node(str(character_data.position)).add_position(character_data,invert)
		if invert:
			self.get_node("0").position.x=-250
			self.get_node("2").position.x=250
