extends Node

#for all game
var time = 5
var malus = false #change the time if activated
var win_state = ""

var game_intro = "pipeting is a important skill\nyou need to be precise !"
var game_rules = "UP/DOWN : increase/decrease\nthe level in the pipette"

# Called when the node enters the scene tree for the first time.
func on_ready():
	pass


func restart(): 
	$liquide.running = false
	return "technically you have several pipettes\n for different amount\n and you can fix the amount you need\n for more precision"
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func process(delta):
	if $liquide.waiting >= 30:
		win()

func start():
	$liquide.running = true
	
func reset():
	$liquide.speed = 1

#called if restart pressed
func win():
	$liquide.running = false
	GlobalVar.win = 1
	GlobalVar.coins +=1
	$liquide.speed = min(10, $liquide.speed+1)
	win_state = "you win"
	
func lose():
	$liquide.running = false
	GlobalVar.win = -1
	win_state = "haha looser"
