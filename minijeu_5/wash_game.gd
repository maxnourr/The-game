
extends Node

#timer
var time = 20

# screen
var width = 0 #will be initialised in ready() 
var height = 0

#game
var lose = false 

#trash
var nb_trash = 10
var linktube = preload("res://trash.tscn") #to create new tube
var rng = RandomNumberGenerator.new()


# Called when the node enters the scene tree for the first time.
func _ready():
	$Button2.hide() #no restart
	$Timer.wait_time = time #set timer
	
	#set screen data
	width = get_viewport().size.x
	height = get_viewport().size.y
	resize() #resize the elements
		

#resize and position each element depending of the screen dimensions
func resize():
	
	$eye.position.x = get_viewport().size.x/2
	$eye.position.y = get_viewport().size.y/2
	
	$eye.scale.x = get_viewport().size.x/1148
	$eye.scale.y = $eye.scale.x
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	#resize if size change !
	if width != get_viewport().size.x or height != get_viewport().size.y:
		width = get_viewport().size.x
		height = get_viewport().size.y
		resize()
		
	#if timer running we update
	if not $Timer.is_stopped():
		#if malus we remove some time
		#do not successed to remove time from timer
		var T = max(0,round($Timer.time_left))
		#update time
		$TEXT/time.text = str(max(0,T))
		
		#if time runs out (do not use signal because of malus
		if T == 0:
			if lose == false:
				$TEXT/win_state.text = "haha looser"
				restart()
			lose = true 

func restart(): 
	$Button2.show() # show restart
			
				

#called if start is pressed, set timer and instanciate tubes
func _on_button_pressed():
	$Button.hide() #hide start
	#instantiate tubes
	for n in nb_trash:
		var trash = linktube.instantiate()
		add_child(trash)
			
		#scale dep on current screen size !
		trash.scale.x = get_viewport().size.x/1152
		trash.scale.y = trash.scale.x
		
		#add random
		#it is a horrible way to do it but it's working, godot destroyed my brain
		randomize()
		trash.position.x = rng.randi_range(get_viewport().size.x/2-270*get_viewport().size.x/1152,get_viewport().size.x/2+270*get_viewport().size.x/1152)
		trash.position.y = rng.randi_range(get_viewport().size.y/2-270*get_viewport().size.y/1152,get_viewport().size.y/2+270*get_viewport().size.y/1152)
		
		
	#set timer
	$TEXT/time.text = str(round($Timer.time_left))
	$Timer.start()
	$trash.started = true

#called if restart pressed
func _on_button_2_pressed():
	$trash.started = false
	$trash.nb_trash = 0
	get_tree().reload_current_scene()

#if exit area, we remove from list
func _on_eye_area_exited(area):
	if area.type == "trash":
		print(area.nb_trash)
		area.nb_trash -= 1
		print(area.nb_trash)
		area.visible = false
		if area.nb_trash <= 0:
			$Timer.stop()
			$trash.started = false
			$TEXT/win_state.text = "you win"
			restart()
	
#move trash if touch by water
func _on_water_area_entered(area):
	if area.type == "trash" and !$Timer.is_stopped():
		area.position.x += (area.position.x-$water.position.x)*0.5
		area.position.y += (area.position.y-$water.position.y)*0.5
