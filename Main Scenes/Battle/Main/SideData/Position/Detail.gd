extends Panel



func _init():
	#connect("show_detail",self,"_show_detail")
	pass


func _show_detail():
	self.visible=true

func _hide_detail():
	self.visible=false
