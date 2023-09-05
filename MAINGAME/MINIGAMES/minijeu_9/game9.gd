extends Node

#for all game
static var time = 15
var malus = false #change the time if activated
var win_state = ""

var game_intro = "Use the vortex to mix your bacteria sample\nfirst, put the tube on the vortex\nsecond, set the speed and hold on !"
var game_rules = "the tube follow the mouse\nUP: increase the speed"

var firstrandom
var secondrandom
var move = false
var velo = false
var intermediate = 0
var waiting_time = 0
var to_wait = 300


func on_ready():
	pass

func process(delta):
	
	var mouse_x = get_viewport().get_mouse_position().x
	# permet de connaître les coordonnées en x de la souris
	
	#permet de bouger le rectangle, c'est là que la variable move prend son sens
	if move :
		$tube.position.x = mouse_x
		if $tube.position.x >= (firstrandom - 5) and $tube.position.x <= (firstrandom + 5) and move:
			$velocity.visible = true
			move = false
			velo = true
			$velocity/RigidBody2D.setter = true	
		
	if velo:
		$tube.swing($velocity/RigidBody2D.currentVelocity)
		if $velocity/RigidBody2D.currentVelocity >40 and $velocity/RigidBody2D.currentVelocity <60 :
			waiting_time += 1
			$velocity/RigidBody2D/text.visible = true
		else:
			$velocity/RigidBody2D/text.visible = true
			waiting_time = 0
		if waiting_time >= to_wait:
			win()

func restart(): 
	return "Vortex are commonly used in the lab\n speed and waiting time are important\n depending of your goal"	

func start():
	firstrandom = GlobalVar.rng.randf_range(100, 800)
	secondrandom = GlobalVar.rng.randf_range(100, 1052)
	$tube.position.y = 280
	$vortex.position.x = firstrandom
	$tube.position.x = secondrandom
	move = true
	
func reset():
	time = 15
	to_wait = 300
	
#called if restart pressed
func win():
	GlobalVar.win = 1
	GlobalVar.coins +=1
	time = max(2,time-1) 
	to_wait = min(500,to_wait+50) 
	win_state = "you win"
	
func lose():
	GlobalVar.win = -1
	win_state = "haha looser"
