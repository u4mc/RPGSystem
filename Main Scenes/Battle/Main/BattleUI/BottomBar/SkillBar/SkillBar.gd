extends VBoxContainer


var SkillButton=preload("res://Main Scenes/Battle/Main/BattleUI/BottomBar/SkillBar/SkillButton.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _initialise(buttons_arg:Array):
	pass
	
func _add_button(title_arg,description_arg):
	var button = SkillButton.instance()
	button.initialise(title_arg,description_arg)
	button.connect("highlight",self,"_on_button_focus")
	button.connect("mouse_off",self,"_on_lose_focus")
	button.connect("left_click",self,"_on_button_left_click")
	button.connect("right_click",self,"_on_button_right_click")
	$IconList.add_child(button)

func add_buttons(buttons:Array):
	for button in buttons:
		_add_button(button.title,button.description)
func _on_button_focus(button_arg):
	$Title/TitleLabel.visible=true
	$Title/TitleLabel.bbcode_text="[center]"+button_arg.button_title+"[/center]"
	$Title/TitleLabel.rect_position.x=(button_arg.rect_position.x-($Title/TitleLabel.rect_size.x/4))
	$Description/DescriptionLabel.visible=true
	$Description/DescriptionLabel.bbcode_text="[center]"+button_arg.button_description+"[/center]"
	$Description/DescriptionLabel.rect_position.x=button_arg.rect_position.x-($Description/DescriptionLabel.rect_size.x/4)

func _on_lose_focus():
	$Title/TitleLabel.visible=false
	$Description/DescriptionLabel.visible=false

func _on_button_left_click(button_arg):
	print(button_arg.button_title+" Clicked")
func _on_button_right_click(button_arg):
	print(button_arg.button_title+" Right Clicked")
