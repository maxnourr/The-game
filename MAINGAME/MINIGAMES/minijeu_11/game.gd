extends Node


#for all game
var time = 10
var malus = false #change the time if activated
var win_state = ""
var run = false

var game_intro = "your bacteria need to catch the cadmium\nbefore it enter intestine walls !"
var game_rules = "directional arrow : move the bacteria"

static var nb_food = 3
var linktube = preload("cadmium.tscn") #to create new tube
var rng = RandomNumberGenerator.new()		
var x = 0
var y = 0

# Called when the node enters the scene tree for the first time.
func on_ready():
	
	$cadmium.set_player($player)
	x = range($player.position.x -100,$player.position.x -50) + range($player.position.x +50,$player.position.x +100)
	y = range($player.position.y -70,$player.position.y -20) + range($player.position.y +20,$player.position.y +70)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func process(delta):
		
	if $cadmium.score == nb_food:
		win()
			

func restart(): 
	$cadmium.destroy()
	$player.running = false
	$cadmium.running = false
	
	return "Cadmium in a bioaccumulative toxic metal.\n When it enter the body it is difficult to take it back.\n A bacteria to remove the cadmium in the intestine ?\n\n Here is 48C'mission !"

func start():
	$cadmium.visible = true
	$cadmium.position.x = x[randi() % x.size()]
	$cadmium.position.y = y[randi() % y.size()]
	
	if nb_food >1:
		for n in nb_food-1:
			var food = linktube.instantiate()
			randomize()
			food.position.x = x[randi() % x.size()]
			food.position.y = y[randi() % y.size()]
			food.set_player($player)
			add_child(food)
	$cadmium.running = true
	$player.running = true
	
func reset():
	nb_food = 3

func _on_border_area_exited(area):
	if area.type == "cadmium" and area.visible:
		$border/CollisionPolygon2D.set_deferred("disabled", true)
		lose()

#called if restart pressed
func win():
	nb_food += 2
	GlobalVar.win = 1
	GlobalVar.coins +=1
	win_state = "you win"
	
func lose():
	$player.set_state("angry")
	GlobalVar.win = -1
	win_state = "haha looser"
