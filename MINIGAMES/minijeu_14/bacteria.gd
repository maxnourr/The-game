extends Area2D 
@export var speed= 400.0
var type = "bacteria"
var running = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if running:
		var direction = Vector2.ZERO
		if Input.is_action_pressed("ui_right"):
			direction.x += 1
		if Input.is_action_pressed("ui_left"):
			direction.x -= 1
		if Input.is_action_pressed("ui_up"):
			direction.y -= 1
		if Input.is_action_pressed("ui_down"):
			direction.y += 1
		
		if direction.length() > 1:
			direction = direction.normalized()
		
		position += direction * speed * delta
		
		if position.x < 0:
			position.x = get_viewport().size.x
		if position.x > get_viewport().size.x:
			position.x = 0
		if position.y < 0:
			position.y = get_viewport().size.y
		if position.y > get_viewport().size.y:
			position.y = 0
	
	



