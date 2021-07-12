extends Object

var o_enemy = load("res://Main Scenes/Battle/Objects/Enemy.gd")

var char_dict={}

func _init(char_arg):
	for character in char_arg:
		char_dict={character.pos:o_enemy.new(character)}
