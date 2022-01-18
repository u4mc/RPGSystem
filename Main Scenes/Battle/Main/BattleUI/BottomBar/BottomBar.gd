extends Control


enum state_def {INACTIVE,CONTROL,INFORMATION}
var state=state_def.INACTIVE
var SkillBar=load("res://Main Scenes/Battle/Main/BattleUI/BottomBar/SkillBar/SkillBar.tscn")

var bottom_stack:Array

var targets:Array
var skill:Skill

func set_state(state_arg):
	match state_arg:
		state_def.INACTIVE:
			pass
		state_def.CONTROL:
			_set_control_state()
			

func _set_control_state():
	_add_basic_bar()
	
func _get_action():
	targets.empty()
	skill=null
	
	#get
func _push_bottom_stack(bar):
	self.remove_child(bottom_stack.back())
	bottom_stack.push_back(bar)
	self.add_child(bar)

func _pop_bottom_stack():
	self.remove_child(bottom_stack.back())
	bottom_stack.remove(bottom_stack.back())
	self.add_child(bottom_stack.back())

func _add_basic_bar():
	var basic_bar=SkillBar.instance()
	basic_bar._add_button("Attack","Perform a basic attack")
	_push_bottom_stack(basic_bar)
	

func _add_skill_bar(skill_buttons):
	var skill_bar=SkillBar.instance()
	
func _confirm_action():
	if targets&&skill!=null:
		pass
		#emit signal that passes action down to BattleUI

func _set_targets(targets_arg:Array):
	targets=targets_arg
func _set_skill(skill_arg:Skill):
	skill=skill_arg
