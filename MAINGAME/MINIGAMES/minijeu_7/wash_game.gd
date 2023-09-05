
extends Node

#for all game
var time = 15
var malus = false #change the time if activated
var win_state = ""
var run = false

var game_intro = "While doing an experiment you \nhad projection on the eyes\nremove everything"
var game_rules = "the jet follow the mouse\ndirts can be hard to remove"

#trash
static var nb_trash = 10
var removed = 0
var linktube = preload("trash.tscn") #to create new tube


# Called when the node enters the scene tree for the first time.
func on_ready():
	pass
		
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func process(delta):
	pass
	
func restart(): 
	return "we really have some special water jets\n in the lab in case of projections"
			
				

#called if start is pressed, set timer and instanciate tubes
func start():
	run = true
	for n in nb_trash:
		var trash = linktube.instantiate()
		add_child(trash)
		
		if n in range(0,nb_trash/2):
			randomize()
			trash.position.x = GlobalVar.rng.randi_range(575-350-450/2,575-350+450/2)
			trash.position.y = GlobalVar.rng.randi_range(325-250/2,325+250/2)
		else:
			randomize()
			trash.position.x = GlobalVar.rng.randi_range(575+350-450/2,575+350+450/2)
			trash.position.y = GlobalVar.rng.randi_range(325-250/2,325+250/2)

#if exit area, we remove from list
func _on_eye_area_exited(area):
	if area.type == "trash":
		area.queue_free()
		removed +=1
		if removed == nb_trash:
			win()
	
#move trash if touch by water
func _on_water_area_entered(area):
	if area.type == "trash" and run == true:
		area.position.x += (area.position.x-$water.position.x)*0.5
		area.position.y += (area.position.y-$water.position.y)*0.5
	
func reset():
	nb_trash = 10
	
func win():
	run = false
	GlobalVar.win = 1
	GlobalVar.coins +=1
	nb_trash += 10
	win_state = "you win"
	$eye.set_type("good")
	
func lose():
	run = false
	GlobalVar.win = -1
	win_state = "haha looser"
