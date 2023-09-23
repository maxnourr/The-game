
extends Node

#for all game
var time = 15
static var bacteria_number = 4
static var current_number = 0
var malus = false #change the time if activated
var win_state = ""
var running = false

#bacteria
var linktube = preload("bacteria.tscn") #to create new bacteria

var game_intro = "For your hydrogel to work, you need bacterias inside \ncatch them !"
var game_rules = "pad/left mouse button : \ncatch a bacteria"

var x = 0
var y = 0
var x_tronc = 0
var y_tronc = 0

# Called when the node enters the scene tree for the first time.
func on_ready():
	
	x = range(50,1152-50)
	y = range(100,648-100)
	x_tronc = range(50,$plate.position.x -200) + range($plate.position.x +200,1152-50)
	y_tronc = range(100,$plate.position.y -200) + range($plate.position.y +200,648-100)
	
	current_number = bacteria_number
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func process(delta):
	pass

func restart(): 
	return "Thessaloniki IGEM team works on a hydrogel \n to apply on the soil after a fire \n they need two bacterias strain in the hydrogel"


#called if start is pressed, set timer and instanciate tubes
func start():
	running = true

	for n in bacteria_number:
		var bacteria = linktube.instantiate()
		bacteria.running = true
		
		if n % 2:
			bacteria.set_type(1)
		else :
			bacteria.set_type(2)
		#add random out of the central square
		#it is a horrible way to do it but it's working, godot destroyed my brain
		#randomize()
		var test = GlobalVar.rng.randi_range(0,1)
		if test == 1:
			bacteria.position.x = x[randi() % x.size()]
			bacteria.position.y = y_tronc[randi() % y_tronc.size()]
		else:
			bacteria.position.x = x_tronc[randi() % x_tronc.size()]
			bacteria.position.y = y[randi() % y.size()]
		add_child(bacteria)
	
func reset():
	bacteria_number = 4

func win():
	running = false
	bacteria_number += 4
	GlobalVar.win = 1
	GlobalVar.coins +=1
	win_state = "you win"
	
func lose():
	running = false
	GlobalVar.win = -1
	win_state = "haha looser"


func _on_plate_area_entered(area):
	if running :
		area.running = false
		current_number -=1
		if current_number <=0:
			win()
	
