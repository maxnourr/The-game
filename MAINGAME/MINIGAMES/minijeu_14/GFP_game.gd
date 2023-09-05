extends Node

#for all game
var time = 10
var malus = false #change the time if activated
var win_state = ""

var game_intro = "Your bacteria need to catch the GFP (green)\nBe careful not to be catched before"
var game_rules = "directional arrows : move the bacteria"

#timer
static var nb_obstacle = 1
var linktube = preload("obstacle.tscn") #to create new tube

# Called when the node enters the scene tree for the first time.
func on_ready():
	$Obstacle.set_player($bacteria)

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func process(delta):
	
	if $Obstacle.touched == true or $GFP.destroyed ==true :
		lose()
		
	if $GFP.taken == true:
		win()
			


func restart(): 
	$Obstacle.running = false
	$bacteria.running = false
	$Obstacle.touched = false
	return "You can modify bacteria so they express GFP\nwhen they do they appear fluorescent and green\n it is use for verification of expression"
	

#called if start is pressed, set timer and instanciate tubes
func start():
	$bacteria.running = true
	$Obstacle.running = true
	
	$Obstacle.visible = true
	#$Obstacle.position.x = rng.randi_range(0,get_viewport().size.x)
	#$Obstacle.position.y = rng.randi_range(0,get_viewport().size.y)
	
	
	$GFP.position.x = randf_range(1152/6,5*1152/6)
	$GFP.position.y = randf_range(0,648/2)
	
	if nb_obstacle >1:
		for n in nb_obstacle-1:
			var obstacle = linktube.instantiate()
			randomize()
			
			if n in range(0,nb_obstacle/2):
				obstacle.position.x = GlobalVar.rng.randi_range(0,1152/6-100)
				obstacle.position.y = GlobalVar.rng.randi_range(0,648)
			else:
				obstacle.position.x = GlobalVar.rng.randi_range(5*1152/6+100,1152)
				obstacle.position.y = GlobalVar.rng.randi_range(0,648)
			
			obstacle.set_player($bacteria)
			add_child(obstacle)
	
	
func reset():
	nb_obstacle = 1

func win():
	nb_obstacle += 1
	GlobalVar.win = 1
	GlobalVar.coins +=1
	win_state = "you win"
	
func lose():
	GlobalVar.win = -1
	win_state = "haha looser"
