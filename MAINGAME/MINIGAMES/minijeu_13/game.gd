extends Node

#for all game
var time = 10
var malus = false #change the time if activated
var win_state = ""

var game_intro = "Virus entered the body !\nWhite blood cell need to catch them"
var game_rules = "directional arrows : move the cell"

static var nb_food = 1
var linktube = preload("res://MINIGAMES/minijeu_13/food.tscn") #to create new tube

# Called when the node enters the scene tree for the first time.
func on_ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func process(delta):
	if $food.score == nb_food :
		win()
			

func restart(): 
	
	$food.destroy()
	$player.running = false
	$food.running = false
	
	return "In some case your body can \nprotect yourselve from infection"


func start():
	$food.visible = true
	$food.position.x = GlobalVar.rng.randi_range(0,1152)
	$food.position.y = GlobalVar.rng.randi_range(0,648)
		
	if nb_food >1:
		for n in nb_food-1:
			var food = linktube.instantiate()
			randomize()
			food.position.x = GlobalVar.rng.randi_range(0,1152)
			food.position.y = GlobalVar.rng.randi_range(0,648)
			food.set_player($player)
			add_child(food)
	$food.running = true
	$player.running = true

func reset():
	$food.speed = 300.0
	nb_food = 1

#called if restart pressed
func win():
	$food.speed = max(100,$food.speed-20)
	nb_food += 1
	GlobalVar.win = 1
	GlobalVar.coins +=1
	win_state = "you win"
	$player.set_state("happy")
	
func lose():
	GlobalVar.win = -1
	win_state = "haha looser"
