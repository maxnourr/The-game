extends Node
var required = 130

#for all game
var time = 15
var malus = false #change the time if activated
var win_state = ""

var game_intro = "theophyllin is quite toxic...\nfill the tube with the right amount\nwithout too much waste"
var game_rules = "the bottle follow the mouse\nbut you are shaking..."

func on_ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func process(delta):
			
	if $tube.filled >= $tube.required:
		win()


func restart(): 
	return "you can use a hood while working with\n dangerous powder\n you have to follow special protocols\n work safe !"

#called if start is pressed, set timer and instanciate tubes
func start():
	$tube.moving = true
	$salt.moving = true
	$salt.rotation = PI
	
func reset():
	$salt.amplitude = 25

#called if restart pressed
func win():
	$salt.amplitude +=10
	GlobalVar.win = 1
	GlobalVar.coins +=1
	win_state = "you win"
	$tube.moving = false
	$salt.moving = false
	
func lose():
	GlobalVar.win = -1
	$tube.moving = false
	$salt.moving = false	
	win_state = "haha looser"
