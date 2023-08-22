extends Area2D
var mousein = false
var used = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if mousein and !PlayerVar.Play and Input.is_action_pressed('click_left') and !used:
		position.x = get_global_mouse_position().x
		position.y = get_global_mouse_position().y
	if used:
		position.x = PlayerVar.PlayerX
		position.y = PlayerVar.PlayerY


func _on_mouse_entered():
	mousein = true


func _on_mouse_exited():
	set_deferred("mousein",false)


func _on_area_entered(area):
	if area.name == "bacteria":
		used = true
		PlayerVar.acidr = true
		area.visible = false
