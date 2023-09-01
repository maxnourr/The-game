extends Area2D 
@export var speed= 400.0
var type = "bacteria"
var running = false

var normal = preload("figures/Bactfaim@4x.png")
var gfp = preload("figures/Bactpufaim@4x.png")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func change(nom):
	if nom == "gfp":
		$Sprite2D.set_texture(gfp)
	else:
		$Sprite2D.set_texture(normal)

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
			position.x = 1152
		if position.x > 1152:
			position.x = 0
		if position.y < 0:
			position.y = 648
		if position.y > 648:
			position.y = 0
	
	

