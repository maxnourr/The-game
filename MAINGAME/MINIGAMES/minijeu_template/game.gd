extends Node

#for all game
static var time = 20
var malus = false #change the time if activated
var win_state = ""

var game_intro = "You can create a new game !\nHere the text to introduce your game"
var game_rules = "here the text to explain how to play"

# Called when the node enters the scene tree for the first time.
func on_ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func process(delta):
	pass
			

func restart(): 
	#you stop moving! 
	$player.running = false
	#add explanation
	return "add a nice explanation here"


func start():
	#the player can move
	$player.running = true
	
func reset():
	time = 20

# if you enter the win area, you win
func _on_win_area_area_entered(area):
	win()

# if you enter the lose area, you lose
func _on_lose_area_area_entered(area):
	lose()

func win():
	GlobalVar.win = 1
	GlobalVar.coins +=1
	win_state = "you win"
	time = max(10,time-2)
	
func lose():
	GlobalVar.win = -1
	$player.set_state("angry")
	win_state = "haha looser"

