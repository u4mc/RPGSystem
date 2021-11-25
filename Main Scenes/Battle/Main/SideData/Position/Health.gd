extends RichTextLabel

var max_HP
var current_HP

var display=self.text

func update_hp(max_HP_arg,current_HP_arg):
	self.text="Health:"+max_HP_arg+"/"+current_HP_arg
	
func _initialise(max_HP_arg,current_HP_arg):
	max_HP=max_HP_arg
	current_HP=current_HP_arg
	update_hp(max_HP_arg,current_HP_arg)
