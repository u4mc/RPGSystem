extends Sprite
#Use to control the sprite
onready var sprite = get_node(".")
var debug_flag=0

func _ready():
	if debug_flag==1:
		sprite.texture=ResourceLoader.load("res://Assets/sprites/character/mage/mage.png")

func initialise(var sprite_arg:Texture):
	sprite.texture=sprite_arg
