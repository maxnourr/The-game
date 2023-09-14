extends Node

#for all game
static var time = 10
var malus = false #change the time if activated
var win_state = ""

var game_intro = "your culture is hungry !"
var game_rules = "left click : drag and drop a item"


# Called when the node enters the scene tree for the first time.
func on_ready():
	pass
			
func process(delta):
	pass
	
func _on_plate_area_entered(area):
	if area.type=="bad":
		lose()
		
	elif area.type=="good":
		win()

#called if start is pressed, set timer and instanciate tubes
func start():
	$LB.running = true
	$Pizza.running = true

	
func reset():
	time = 10
	
func restart(): 
	$LB.running = false
	$Pizza.running = false
	return "depending of the strain\n high salt concentration can be dangerous for bacterias\n LB medium is full of good nutriments\n to make them grow !"

#called if restart pressed
func win():
	GlobalVar.win = 1
	GlobalVar.coins +=1
	time = max(8,time-4)
	win_state = "you win"
	
func lose():
	GlobalVar.win = -1
	win_state = "haha looser"
	$Plate.texture("sad")
