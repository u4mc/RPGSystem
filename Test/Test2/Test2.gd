extends Control


var test=Loader.load_menu("GetBattleAction").instance()


# Called when the node enters the scene tree for the first time.
func _ready():
	test._initialise(load("res://Resources/test/character/Murasaki.tres"))
	self.add_child(test)
	#yield complete
	
	#get outputs
	
	#destroy
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
