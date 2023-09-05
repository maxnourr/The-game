extends Area2D
var fill = 0
var max = 15
var rng = RandomNumberGenerator.new()
var running = false


func _ready():
	var firstrandom = rng.randf_range(1, 2.9)
	fill = floor(firstrandom) * 5
	
	#pour donner une valeur initiale à fill random, pas super utile tbh



func _process(delta):
	if running:
		$Label.text = str(fill)
		var mouse_x = get_viewport().get_mouse_position().x
		var mouse_y = get_viewport().get_mouse_position().y
		position.x = mouse_x
		position.y = mouse_y
	# scotch la seringue à la souris
		if Input.is_action_just_pressed("click_left") and fill > 0:
			fill = fill - 5
		#vide la seringue, possible même en dehors d'une fiole
		
	

