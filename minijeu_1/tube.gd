extends Area2D
var type = "BLUE"
var textureAMPI = preload("res://AMPI.png")
var textureBLUE = preload("res://BLUE.png")
var textureSOC = preload("res://SOC.png")
var CanDrag = false

# Called when the node enters the scene tree for the first time.
func _ready():
	set_type(type)

func set_type(T):
	type = T
	if type == "AMPI":
		$Sprite2D.set_texture(textureAMPI)
	elif type == "BLUE":
		$Sprite2D.set_texture(textureBLUE)
	else: 
		$Sprite2D.set_texture(textureSOC)
	
func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseMotion:
		if Input.is_action_pressed("ui_up"):
			CanDrag = true
		else:
			CanDrag = false
	#if event is InputEventMouseMotion:
	#	if event.button_mask == 1 and event.is_pressed():
	#		CanDrag = true
	#	else:
	#		CanDrag = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if CanDrag:
		$".".global_position = get_global_mouse_position()
