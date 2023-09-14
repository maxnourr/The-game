extends Area2D

#all the different type
var type_list = ["AMPI","SOC","BLUE"] 
var type = "BLUE"
var textureAMPI = preload("figures/AMPI.png")
var textureBLUE = preload("figures/BLUE.png")
var textureSOC = preload("figures/SOC.png")
static var on_game = false
var is_mouse_inside = false

# Called when the node enters the scene tree for the first time.
func _ready():
	set_type(type)

func set_type(T):
	
	#change texture according to type
	type = T
	if type == "AMPI":
		$Sprite2D.set_texture(textureAMPI)
	elif type == "BLUE":
		$Sprite2D.set_texture(textureBLUE)
	else: 
		$Sprite2D.set_texture(textureSOC)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_mouse_inside and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and on_game:
		var mouse_position = get_viewport().get_mouse_position()
		position.x = mouse_position.x
		position.y = mouse_position.y

func _on_mouse_entered():
	is_mouse_inside=true

func _on_mouse_exited():
	is_mouse_inside=false

			
