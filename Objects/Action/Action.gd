extends Resource

class_name Action

func init_class(class_name_arg:String):
	match class_name_arg:
		"Death":
			return Death.new()

class Death:
	var position:Node
	var type="Death"
	func initialise(position_arg:Node):
		position=position_arg
	
	func process(side_data):
		#call death action on pos
		position.death()
		#remove character from turn order
		side_data.death(position)
		#check if side is dead
		match side_data.check_side_loss():
			"victory":
				Signals.battle.emit_signal("push_action_stack",Victory.new())
			"defeat":
				Signals.battle.emit_signal("push_action_stack",Defeat.new())
		#if side is dead push victory action

		
class Victory:
	var type="Victory"
	func initialise():
		pass
	
	func process():
		print("VICTORY")
		
		
		
class Defeat:
	var type="Defeat"
	func initialise():
		pass
	
	func process():
		pass
		
		
