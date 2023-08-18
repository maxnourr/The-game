extends Area2D
var rng = RandomNumberGenerator.new()
var decalage = 0
static var amplitude = 25
var moving = false
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if moving:
		var mouse_x = get_viewport().get_mouse_position().x
		var mouse_y = get_viewport().get_mouse_position().y
		decalage += rng.randf_range(-amplitude,amplitude)
		if abs(decalage) >= 500:
			decalage = 0
		position.x = mouse_x + decalage
		position.y = mouse_y
