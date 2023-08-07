extends Node

#timer
var time = 20

# screen
var width = 0 #will be initialised in ready() 
var height = 0

#temperature
var temp = 0
var rng = RandomNumberGenerator.new()

#game
var lose = false 
var goal = 0 #temperature goal
var timelapse = 0 #time at the good temp
var to_wait = 250 #goal time at the good temp
var is_reatched = false #are you at the good temp ? 
var min = -15 #min temp
var max = 60 #max temp

# Called when the node enters the scene tree for the first time.
func _ready():
	$Button3/Label.set_text("coins : " + str(GlobalVar.coins))
	$Button2.hide() #no restart
	$Timer.wait_time = time #set timer
	
	#random temp goal
	goal = rng.randi_range(min,max)
	
	#set screen data
	width = get_viewport().size.x
	height = get_viewport().size.y
	resize() #resize the elements
		

#resize and position each element depending of the screen dimensions
func resize():
	width = get_viewport().size.x
	height = get_viewport().size.y
	
	$plate.position.x = 285*get_viewport().size.x/1152
	$plate.position.y = 313*get_viewport().size.y/648
	$plate.scale.x = get_viewport().size.x/1152
	$plate.scale.y = $plate.scale.x
	
	$up.position.x = 901*get_viewport().size.x/1152
	$up.position.y = 251*get_viewport().size.y/648
	$up.scale.x = get_viewport().size.x/1152
	$up.scale.y = $plate.scale.x
	
	$down.position.x = 901*get_viewport().size.x/1152
	$down.position.y = 374*get_viewport().size.y/648
	$down.scale.x = get_viewport().size.x/1152
	$down.scale.y = $plate.scale.x
	
	$TEXT/temperature.position.x = 791*get_viewport().size.x/1152
	$TEXT/temperature.position.y = 100*get_viewport().size.y/648
	$TEXT/temperature.scale.x = get_viewport().size.x/1152
	$TEXT/temperature.scale.y = $plate.scale.x
	
	$TEXT/number.position.x = 872*get_viewport().size.x/1152 - (get_viewport().size.x/1152-1)*300
	$TEXT/number.position.y = 184*get_viewport().size.y/648
	$TEXT/number.scale.x = get_viewport().size.x/1152
	$TEXT/number.scale.y = $plate.scale.x
	
	
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
		
		#verif temp and play the right texture
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
				timelapse += 1 #wait at the good time
				if timelapse == to_wait :
					$TEXT/win_state.text = "you win"
					GlobalVar.coins +=1
					$Timer.stop()
					restart()

func restart(): 
	if lose == true:
		$Button2.set_text("Restart")
	else:
		$Button2.set_text("Continue")
	$Button2.show() # show restart
	$Button3.show()
	$Button3/Label.set_text("coins : "+str(GlobalVar.coins))
	$TEXT/explanation.text = "You need a specific temperature to grow bacteria"

#called if start is pressed, set timer and instanciate tubes
func _on_button_pressed():
	$Button.hide() #hide start	
	$Button3.hide()
	#set timer
	$TEXT/time.text = str(round($Timer.time_left))
	$Timer.start()

#called if restart pressed
func _on_button_2_pressed():
	
	if GlobalVar.on_randon == true and lose == false:
		GlobalVar.pass_game()
	else:
		if not lose :
			$Timer.wait_time -= 1
		get_tree().reload_current_scene()

#increase temp
func _on_up_pressed():
	if temp < max:
		temp += 1

#decrease temp
func _on_down_pressed():
	if temp > min:
		temp -= 1


func _on_button_3_pressed():
	GlobalVar.to_menu()
