extends Control
var active=false
onready var message_text=$MarginContainer/RichTextLabel

func activate_message_box(message_text_arg:String):
	self.visible=true
	message_text.bbcode_text="[center]"+message_text_arg+"[/center]"
	yield(get_tree().create_timer(2), "timeout")
	self.visible=false
	
