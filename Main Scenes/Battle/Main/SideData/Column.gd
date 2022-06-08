extends Position2D

var pos_scene =preload("res://Main Scenes/Battle/Main/SideData/Position/Position.tscn")

const pos_size=120

func _initialise(var pos_array:Array):
	for pos in pos_array:
		add_position(pos,false)

func set_valid_targets():
	for p in self.get_children():
		p.set_valid_target()
func add_position(var pos_data:Resource,invert_arg):
	if self.get_children().size()>3:
		return
	var instance = pos_scene.instance()
	instance._initialise(pos_data,"a",invert_arg)
	add_child(instance)
	_adjust_position()

func remove_position(node):
	remove_child(node)
	node.queue_free()
	_adjust_position()


func death(pos):
	remove_position(pos)

func get_all_character():
	return self.get_children()
func _adjust_position():
	var positions=self.get_children()
	match positions.size():
		1:
			positions[0].position.y=0
		2:
			positions[0].position.y=pos_size*0.5
			positions[1].position.y=pos_size*-0.5
			positions[0].set_z_index(1)
			positions[1].set_z_index(0)
		3:
			positions[0].position.y=pos_size*-1
			positions[1].position.y=pos_size*0
			positions[2].position.y=pos_size*1
			positions[0].set_z_index(1)
			positions[1].set_z_index(0)
			positions[2].set_z_index(2)
