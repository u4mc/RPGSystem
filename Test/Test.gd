extends Node

var states={
	"state1":load("res://Test/State/State1.gd"),
	"state2":load("res://Test/State/State2.gd")
}
var substates={
	"substate1":load("res://Test/Substate/Substate1.gd"),
	"substate2":load("res://Test/Substate/Substate2.gd")
}
var active=false
var next_state


# Called when the node enters the scene tree for the first time.

func _process(delta):
	if active==true||next_state==null:
		return
	run_state()

func set_next_state(arg):
	next_state=arg
	

func run_state():
	active=true
	var state=states.get(next_state).new()
	self.add_child(state)
	state.state_machine=self
	var st=state.activate()
	if st is GDScriptFunctionState: # Still working.
		st = yield(st,"completed")
	remove_child(state)
	active=false


func get_substate(arg):
	return substates.get(arg).new()

func _on_PrintText_pressed():
	next_state="state1"


func change_text(arg):
	$Text.text=arg
	yield(get_tree().create_timer(2),"timeout")
