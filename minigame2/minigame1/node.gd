extends Node

var rng = RandomNumberGenerator.new()
var firstrandom
var secondrandom
var move = true
# deux valeurs randoms différentes, une qui est le goal et une qui est la valeur de départ
# move est là pour immobiliser le rectangle une fois la partie gagnée.
func _ready():
	# les valeurs randoms et les positions sont des nombres fixes de pixel, à changer
	#Si on veut une taille d'écran variable.
	firstrandom = rng.randf_range(200, 1000.0)
	secondrandom = rng.randf_range(0, 1000.0)
	$bloc.position.y = 20
	$bloc2.position.y = 220
	$bloc3.position.y = 420
	$bloc.position.x = firstrandom
	$bloc2.position.x = secondrandom
	$bloc3.position.x = firstrandom
	

func _process(delta):
	var mouse_x = get_viewport().get_mouse_position().x
	# permet de connaître les coordonnées en x de la souris
	if move:
		#permet de bouger le rectangle, c'est là que la variable move prend son sens
		$bloc2.position.x = mouse_x
	if($bloc2.position.x >= (firstrandom - 5) and $bloc2.position.x <= (firstrandom + 5)):
		$CanvasLayer/Label.text = "you win!"
		move = false
