extends Control

signal confirm

func activate():
	print("Activate")
	
	$Selection.activate()
	$Selection2.activate()
	$Confirm.activate()
	
	$Confirm.connect("confirm",self,"_on_Confirm_pressed")
	
	yield(self,"confirm")
	print("End activation")

func _on_Activate_pressed():
	activate()


func _on_Confirm_pressed():
	var a=$Selection.output
	var b=$Selection2.output
	if a==null||b==null:
		print("invalid output")
		return
	print("valid output ",a+b)
	$Selection.deactivate()
	$Selection2.deactivate()
	$Confirm.deactivate()
	emit_signal("confirm")
