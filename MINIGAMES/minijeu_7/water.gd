extends Area2D

var type = "water"
# Called when the node enters the scene tree for the first time.
func _ready():
	position.x = get_viewport().get_mouse_position().x
	position.y = get_viewport().get_mouse_position().y


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x = get_viewport().get_mouse_position().x
	position.y = get_viewport().get_mouse_position().y

