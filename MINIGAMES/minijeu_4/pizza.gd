extends Area2D

var type="bad"
var is_mouse_inside: bool=false
var running = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_mouse_inside and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and running:
		var mouse_position = get_viewport().get_mouse_position()
		position.x = mouse_position.x
		position.y = mouse_position.y

func _on_mouse_entered():
	is_mouse_inside=true

func _on_mouse_exited():
	is_mouse_inside=false
