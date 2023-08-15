extends Node
var required = 130
var time = 10

func _ready():
	$Button3/Label.set_text("coins : " + str(GlobalVar.coins))
	$Button2.hide() #no restart
	$Timer.wait_time = time #set timer
	
	if GlobalVar.on_hard_core:
		_on_button_pressed()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !$Timer.is_stopped():
		var T = max(0,round($Timer.time_left))
		#update time
		$clock/time.text = str(max(0,T))
		
		#if time runs out (do not use signal because of malus
		if T == 0:
			$Timer.stop()
			$tube.moving = false
			$salt.moving = false
			$BackGround.color=Color(1, 0.231, 0.231)
			$TEXT/win_state.text = "haha looser"
			restart()
			
			
		if $tube.filled >= $tube.required:
			GlobalVar.win = true
			$Timer.stop()
			$tube.moving = false
			$salt.moving = false
			$BackGround.color=Color(0.643, 1, 0.486)
			$TEXT/win_state.text = "you win"
			GlobalVar.coins +=1
			restart()


func restart(): 
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

#called if start is pressed, set timer and instanciate tubes
func _on_button_pressed():
	$Button.hide() #hide start
	$Button3.hide()
	#instantiate tubes	
	#set timer
	$clock.visible = true
	$clock/time.text = str(round($Timer.time_left))
	$tube.moving = true
	$salt.moving = true
	$salt.rotation = PI
	$Timer.start()

#called if restart pressed
func _on_button_2_pressed():
	if GlobalVar.win:
		$salt.amplitude +=10
	if GlobalVar.on_randon == true:
		GlobalVar.pass_game()
	else:
		GlobalVar.to_load(GlobalVar.game[5])


func _on_button_3_pressed():
	GlobalVar.to_game_list()
