extends Node

static var time = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	$Button3/Label.set_text("coins : " + str(GlobalVar.coins))
	$Button2.hide() #no restart
	$Timer.wait_time = time #set timer

	if GlobalVar.on_hard_core:
		_on_button_pressed()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not $Timer.is_stopped():
		var T = max(0,round($Timer.time_left))
		
		$clock/time.text = str(max(0,T))
		
		if T == 0:
			$Timer.stop()
			$ColorRect.color=Color(1, 0.231, 0.231)
			$TEXT/win_state.set_text("haha looser")
			restart()
			
func _on_plate_area_entered(area):
	if area.type=="bad" and !$Timer.is_stopped():
		$Timer.stop()
		$Plate.texture("sad")
		$ColorRect.color=Color(1, 0.231, 0.231)
		$TEXT/win_state.set_text("haha looser")
		restart()
		
	elif area.type=="good" and !$Timer.is_stopped():
		$Timer.stop()
		GlobalVar.win = true
		GlobalVar.coins += 1
		$ColorRect.color=Color(0.643, 1, 0.486)
		$TEXT/win_state.set_text("you win")
		restart()

#called if start is pressed, set timer and instanciate tubes
func _on_button_pressed():
	$Button.hide() #hide start
	$Button3.hide()
	#instantiate tubes
	#set timer
	$LB.running = true
	$Pizza.running = true
	
	$clock.visible = true
	$clock/time.text = str(round($Timer.time_left))
	$Timer.start()

#called if restart pressed
func _on_button_2_pressed():
	if GlobalVar.win:
		time = max(2,time-1)
	if GlobalVar.on_randon == true:
		GlobalVar.pass_game()
	else:
		GlobalVar.to_load(GlobalVar.game[3])


func _on_button_3_pressed():
	GlobalVar.to_game_list()
	
func restart(): 
	$LB.running = false
	$Pizza.running = false
	
	if GlobalVar.on_hard_core:
		_on_button_2_pressed()
	else:
		if not GlobalVar.win:
			$Button2.set_text("Restart")
		else:
			$Button2.set_text("Continue")
		$Button2.show() # show restart
		$Button3.show()
		$Button3/Label.set_text("coins : "+str(GlobalVar.coins))
