extends Area2D
var rng = RandomNumberGenerator.new()
var x
var y
var direction = Vector2.ZERO


# Called when the node enters the scene tree for the first time.
func _ready():
	x = rng.randf_range(-5,5)
	y = rng.randf_range(-5,5)
	direction.x = x
	direction.y = y
	direction = direction.normalized()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += direction * delta * 70
	
	if position.x >= get_viewport().size.x + (25*scale.x) or position.x <= - (25*scale.x):
		direction.x = -direction.x
	if position.y>= get_viewport().size.y + 25*scale.y or position.y <= -25*scale.y:
		direction.y = -direction.y
