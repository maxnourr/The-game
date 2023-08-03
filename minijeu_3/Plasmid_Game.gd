extends Node

#timer
var time = 10

# screen
var width = 0 #will be initialised in ready() 
var height = 0

#temperature
var temp = 0
var rng = RandomNumberGenerator.new()
var goal = 0
var timelapse = 0
var to_wait = 250
var is_reatched = false
var min = -15
var max = 70

#game
var lose = false 

# Called when the node enters the scene tree for the first time.
func _ready():
	$Button2.hide() #no restart
	$Timer.wait_time = time #set timer
	
	goal = rng.randi_range(min,max)
	
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
		
	var T = max(0,round($Timer.time_left))
		#update time
		
	#if timer running we update
	if not $Timer.is_stopped():
		
		$TEXT/time.text = str(max(0,T))
		#if time runs out (do not use signal because of malus
		if T == 0:
			if lose == false:
				$TEXT/win_state.text = "haha looser"
				restart()
			lose = true 
		
		$TEXT/number.text = str(temp)
		
		
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
				timelapse += 1
				if timelapse == to_wait :
					$TEXT/win_state.text = "you win"
					$Timer.stop()
					restart()

func restart(): 
	$Button2.show() # show restart
	$TEXT/explanation.text = "You need a specific temperature to grow bacteria"

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


func _on_up_pressed():
	if temp < max:
		temp += 1


func _on_down_pressed():
	if temp > min:
		temp -= 1
