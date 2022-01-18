extends Reference

var sprite:Sprite
var tween:=Tween.new()

func _initialise(sprite_arg):
	sprite=sprite_arg

func default_take_damage():
	#flash red
	#fade to default
	pass
	
func default_attack():
	#flash white twice
	sprite.modulate().interpolate_property()
	tween.interpolate_property(sprite,"modulate",Color(0.53,0.53,0.53,1),Color(1, 1, 1, 1),4,Tween.TRANS_LINEAR, Tween.EASE_IN)
	
	pass

func default_take_heal():
	#flash green
	#fade to default
	pass

