extends Node

#timer
var time = 15

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
			$BackGround.color=Color(1, 0.231, 0.231)
			$TEXT/win_state.text = "haha looser"
			$seringue_true.running = false
			restart()
			
		$tube.check($seringue_true.fill)
		$tube2.check($seringue_true.fill)
		$tube3.check($seringue_true.fill)
		
		if $tube.score == $tube.required_score:
			GlobalVar.win = true
			$Timer.stop()
			$BackGround.color=Color(0.643, 1, 0.486)
			$TEXT/win_state.text = "you win"
			$seringue_true.running = false
			GlobalVar.coins +=1
			restart()
			
		if $tube.lose == true or $tube2.lose == true or $tube3.lose == true:
			$Timer.stop()
			$BackGround.color=Color(1, 0.231, 0.231)
			$TEXT/win_state.text = "haha looser"
			$seringue_true.running = false
			restart()
	
			
	
func restart(): 
	$TEXT/explanation.text = "when you add a liquid in a tube with bacterias\n you can't take it back\n you can't use the same tip two times\n you can't put it back in the becher"
	$tube.destroy()
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
	

func _on_chaudron_area_entered(area):
	if !$Timer.is_stopped() and area.max >= area.fill +5:
		area.fill += 5 # Replace with function body.


#called if start is pressed, set timer and instanciate tubes
func _on_button_pressed():
	$screen.hide()
	$Button.hide() #hide start
	$Button3.hide()
	#instantiate tubes	
	#set timer
	$clock.visible = true
	$clock/time.text = str(round($Timer.time_left))
	$seringue_true.running = true
	$tube/Label.visible = true
	$tube2/Label.visible = true
	$tube3/Label.visible = true
	
	$Timer.start()

#called if restart pressed
func _on_button_2_pressed():
	if GlobalVar.win:
		$tube.max = min(5.1,$tube.max+1)
	if GlobalVar.on_randon == true:
		GlobalVar.pass_game()
	else:
		GlobalVar.to_load(GlobalVar.game[9])

func _on_button_3_pressed():
	reset()
	$tube.destroy()
	GlobalVar.to_game_list()
	
func reset():
	$tube.max = 2.1
