extends LineEdit


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TerminalIn_text_entered(new_text):
	self.text=""
	process_input(new_text)


func process_input(input):
	var a = input.split(".")
	if a.size()==2:
		Signals.get(a[0]).emit_signal(a[1])
	if a.size()==3:
		Signals.get(a[0]).emit_signal(a[1],a[2])
	if a.size()==4:
		Signals.get(a[0]).emit_signal(a[1],a[2],a[3])
	else:
		Signals.terminal.emit_signal("terminal_out","Invalid Command")

