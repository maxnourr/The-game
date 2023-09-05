extends Node

#for all game
static var time = 5
var malus = false #change the time if activated
var win_state = ""

var game_intro = "Your western blot is bad....\nmaybe you can move the line ?\nnobody will know ...right ?"
var game_rules = "the line follow the mouse\nalign with the others "

var firstrandom
var secondrandom
var move = false

# deux valeurs randoms différentes, une qui est le goal et une qui est la valeur de départ
# move est là pour immobiliser le rectangle une fois la partie gagnée.	
func on_ready():
	pass

func process(delta):
	
	var mouse_x = get_viewport().get_mouse_position().x
	# permet de connaître les coordonnées en x de la souris
	
	#permet de bouger le rectangle, c'est là que la variable move prend son sens
	$bloc2.position.x = mouse_x
	if($bloc2.position.x >= (firstrandom - 5) and $bloc2.position.x <= (firstrandom + 5)):
		win()

#called if restart pressed
func win():
	GlobalVar.win = 1
	GlobalVar.coins +=1
	time = max(1,time-1) 
	move = false
	win_state = "you win"
	
func lose():
	move = false
	win_state = "haha looser"
	
func restart(): 
	return "the distance traveled by the material \n(RNA,DNA,protein, here RNA)\n is proportionnal to their size and weight.\n the ladder contains known size and is use\n to determine the size by comparaison"


func start():
	firstrandom = GlobalVar.rng.randf_range(200, 1000.0)
	secondrandom = GlobalVar.rng.randf_range(0, 1000.0)
	$bloc.position.y = 80
	$bloc2.position.y = 220
	$bloc3.position.y = 360
	$bloc.position.x = firstrandom
	$bloc2.position.x = secondrandom
	$bloc3.position.x = firstrandom
	move = true


func reset():
	time = 5
