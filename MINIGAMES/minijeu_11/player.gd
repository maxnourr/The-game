extends Area2D
@export var speed = 400.0
var running = false
var type = "player"

var happy = preload("figures/happy.png")
var angry = preload("figures/angry.png")

func _ready():
	set_state("happy")
	
func set_state(state):
	if state == "happy":
		$Sprite2D.set_texture(happy)
	elif state == "angry":
		$Sprite2D.set_texture(angry)
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
