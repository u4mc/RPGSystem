extends Container

signal side_menu_button

export var button_text:String

export var button_signal:String

onready var button_rtl = get_node("RichTextLabel")

func _ready():
	button_rtl.text=button_text
