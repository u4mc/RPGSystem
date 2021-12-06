extends Node

class_name Skill
#Skill data
var skill_data:Reference

var attacker:Array#Array of character nodes

var defender:Array#Array of character nodes

func initialise(skill_data_arg:Reference,attacker_arg:Array,defender_arg:Array):

	set_skill_data(skill_data_arg)
	attacker=attacker_arg
	defender=defender_arg
	
func set_skill_data(skill_data_arg):
	skill_data=skill_data_arg

func get_skill_message():
	return attacker[0].get_name()+" attacked "+defender[0].get_name()

