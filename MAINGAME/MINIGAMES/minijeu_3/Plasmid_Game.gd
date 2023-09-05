extends Node

#for all game
static var time = 20
var malus = false #change the time if activated
var win_state = ""

var game_intro = "What is the growing temperature\nof this strain, again ?"
var game_rules = "click on the button to increase/decrease\n the temperature"

#temperature
var temp = 0

#game
var goal = 0 #temperature goal
var timelapse = 0 #time at the good temp
var to_wait = 250 #goal time at the good temp
var is_reatched = false #are you at the good temp ? 
var min = -20 #min temp
var max = 60 #max temp

# Called when the node enters the scene tree for the first time.
func on_ready():
	#random temp goal
	goal = GlobalVar.rng.randi_range(min,max)
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func process(delta):
		
	$TEXT/number.text = str(temp)
		
		#verif temp and play the right texture
	if temp < goal:
		$plate.texture("ice")
		if is_reatched:
			is_reatched = false
			timelapse = 0
	elif temp > goal:
		$plate.texture("fire")
		if is_reatched:
			is_reatched = false
			timelapse = 0
	if temp==goal:
		$plate.texture("normal")
			
		if !is_reatched: 
			is_reatched = true
		else: 
			timelapse += 1 #wait at the good time
			if timelapse == to_wait :
				win()

func restart(): 
	return "Each bacteria strain have a prefered temperature to grow\n when working with bacterias\n you have to be careful to use the right temperature\n fun fact: bacterias also like to be shaked !"

#called if start is pressed, set timer and instanciate tubes
func start():
	$TEXT.show()

#increase temp
func _on_up_pressed():
	if temp < max:
		temp += 1

#decrease temp
func _on_down_pressed():
	if temp > min:
		temp -= 1
	
func reset():
	time = 20

#called if restart pressed
func win():
	GlobalVar.win = 1
	GlobalVar.coins +=1
	time = max(8,time-4)
	win_state = "you win"
	
func lose():
	win_state = "haha looser"
