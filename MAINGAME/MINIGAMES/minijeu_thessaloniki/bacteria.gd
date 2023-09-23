extends Area2D

var type = 1
var running = false
var is_mouse_inside = false
static var free = true
var is_this = false

var direction = Vector2(1,1)
var velocity = 0.8

# Called when the node enters the scene tree for the first time.
func _ready():
	free = true
	type = 1

func set_type(T):
	if T==1:
		type = 1
		$bact1.visible = true
		$bact2.visible = false
		$Collision1.visible = true
		$Collision1.visible = false
	elif T==2:
		type = 2
		$bact1.visible = false
		$bact2.visible = true
		$Collision1.visible = false
		$Collision1.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if free == true or is_this == true:
		if is_mouse_inside and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and running:
			var mouse_position = get_viewport().get_mouse_position()
			position.x = mouse_position.x
			position.y = mouse_position.y
			if is_this ==false:
				is_this = true
				free = false
		elif is_this == true:
			is_this = false
			free = true
			
	if running and is_this == false:
		direction.x += randf_range(-0.2,0.2)
		direction.y += randf_range(-0.2,0.2)
		direction = direction.normalized()
	
		var v = velocity + randf_range(-0.1,0.1)
		if v > 0.5 and v <3:
			velocity = v
	
		position = position + velocity*direction
	
	#pour pas que la tortue s'en aille vers d'autre cieux
		if position.x > 1200:
			position.x = 0
		if position.x <-100:
			position.x = 1152
		if position.y > 600:
			position.y = 0
		if position.y <-100:
			position.y = 600

func _on_mouse_entered():
	is_mouse_inside=true

func _on_mouse_exited():
	is_mouse_inside=false


