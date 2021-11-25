extends Node

#func roll_initiative():
#	var out:Array = side.values()
#	for c in out:
#		c.roll_initiative()
#		print(c.name)
#	return out
func get_random_target():
	
	#return character
	pass

func get_character(position:String):
	return get_node(position)

func get_all_character():
	#returns array of nodes
	var characters:Array
	for character in self.get_children():
		if character.active==true:
			characters.append(character)
	return characters

func _initialise(var side_data_arg:Array):
	for character_data in side_data_arg:
		get_node(character_data.position)._initialise(character_data,self.name)

func _init():
	Signals.SideData.connect("damage_character",self,"_damage_character")

func _damage_character(position:String,damage_value:int):
	if get_node(position).active==true:
		get_node(position).damage_character(damage_value)
	

func _ready():
	pass
	_damage_character("Front",20)
