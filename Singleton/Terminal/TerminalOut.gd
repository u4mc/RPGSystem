extends RichTextLabel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _new_line(new_text):
	self.text=self.text+"\n"+new_text
	
func _clear():
	self.text=""

func _init():
	Signals.terminal.connect("out",self,"_new_line")
	Signals.terminal.connect("clear",self,"_clear")
