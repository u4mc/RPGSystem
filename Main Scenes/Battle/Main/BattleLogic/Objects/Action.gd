extends Reference


class Action:
	var priority:int #Used when sorting the action stack
	var resolved:bool #When set to false do not act on this action
	
	var effects:Array
class AttackAction extends Action:
	var skill:Skill
	var user:Node
	var target:Array#array of nodes

class Effect:
	var target:Node
	var damage:int
	var heal
