extends Node

var current_track=load("res://Test/TestAnimation/AnimationTrack/ConsoleTrack.tres")
var frame=0
#Main Functions

func run_track(track):
	track=current_track
	

	
#Functions
func _run_animation(animation:String,node):
	node.animation_player.run(animation)

func _print_console(arg:Array):
	print(arg[0])


func _run_function(func_ref:String,args:Array):
	self.call(func_ref,args)
	
func test():
	print("Test start")
	_on_Timer_timeout()
	$Timer.start(1)


func _on_Timer_timeout():
	print("timeout "+str(frame))
	if frame in current_track.track:
		for action in current_track.track[frame]:
			_run_function(action.function,action.arg)
	frame=frame+1
