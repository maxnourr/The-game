extends Area2D
var rng = RandomNumberGenerator.new()
var decalage = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var mouse_x = get_viewport().get_mouse_position().x
	var mouse_y = get_viewport().get_mouse_position().y
	decalage += rng.randf_range(-25,25) 
	position.x = mouse_x + decalage
	position.y = mouse_y
