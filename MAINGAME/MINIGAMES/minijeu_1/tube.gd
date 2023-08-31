extends Area2D

#all the different type
var type_list = ["AMPI","SOC","BLUE"] 
var type = "BLUE"
var textureAMPI = preload("figures/AMPI.png")
var textureBLUE = preload("figures/BLUE.png")
var textureSOC = preload("figures/SOC.png")
var CanDrag = false
static var on_game = false

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
	if CanDrag and on_game:
		$".".global_position =  get_global_mouse_position()


func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseMotion:
		if Input.is_action_pressed("click"):
			CanDrag = true
		else:
			CanDrag = false
			
