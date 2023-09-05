extends Node

#for all game
var time = 5
var malus = false #change the time if activated
var win_state = ""

var game_intro = "You have dirt in your bench...\nClean the lab with the sponge"
var game_rules = "the sponge follow the mouse"

var sco = 0
static var nb_dirt = 20
var linktube = preload("dirt.tscn") #to create new tube

func on_ready():
	updateScoreLabel()    

func process(delta):
		
	if sco != $MarginContainer/mouse.score:
		sco = $MarginContainer/mouse.score
		updateScoreLabel()
	
func restart(): 
	return "cleaning is super important !\n not fun, we know"

func increaseScore():
	#score += points
	sco = $MarginContainer/mouse.score
	updateScoreLabel()

# Function to update the score text on the Label.
func updateScoreLabel():
	var labelNode = $MarginContainer/Scorelabel
	labelNode.text = "Score: " + str(sco)
	if sco >= nb_dirt:
		win()
		

func start():
	
	$MarginContainer/mouse.running = true
	for n in nb_dirt:
		var dirt = linktube.instantiate()
		randomize()
		dirt.position.x = GlobalVar.rng.randi_range(220,1152-50)
		dirt.position.y = GlobalVar.rng.randi_range(120,648-50)
		add_child(dirt)
		

func reset():
	nb_dirt = 20
	
#called if restart pressed
func win():
	$MarginContainer/mouse.running = false
	GlobalVar.win = 1
	GlobalVar.coins +=1
	nb_dirt +=10
	win_state = "you win"
	
func lose():
	$MarginContainer/mouse.running = false
	GlobalVar.win = -1
	win_state = "haha looser"
