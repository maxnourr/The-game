extends Node

#timer
var time = 5

# screen
var width = 0 #will be initialised in ready() 
var height = 0

#temperature
var rng = RandomNumberGenerator.new()

#game
var lose = false 

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
	width = get_viewport().size.x
	height = get_viewport().size.y
	#at the center
	#$bacterias.position.x = get_viewport().size.x/2
	#$bacterias.position.y = get_viewport().size.y/2
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#resize if size change !
	if width != get_viewport().size.x or height != get_viewport().size.y:
		width = get_viewport().size.x
		height = get_viewport().size.y
		resize()
		
	#if timer running we update
	if not $Timer.is_stopped():
		
		if $Timer.time_left <=3:
			$plate/bacterias.texture("fire")
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
	$TEXT/explanation.text = "Ampicillin is an antibiotic\nmodified bacterias have antibiotic resistance\n adding AMPI will avoid contamination"
	

#called if start is pressed, set timer and instanciate tubes
func _on_button_pressed():
	$Button.hide() #hide start	
	#set timer
	$TEXT/time.text = str(round($Timer.time_left))
	$Timer.start()

#called if restart pressed
func _on_button_2_pressed():
	if not lose :
		$Timer.wait_time -= 1
	get_tree().reload_current_scene()
