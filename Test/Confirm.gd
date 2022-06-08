extends Button
signal confirm

func _on_Confirm_pressed():
	emit_signal("confirm")


func activate():
	print("button activate")

func deactivate():
	print("Deactivate button")
