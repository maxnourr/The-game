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
		$TEXT/time.text = str(max(0,T))
		
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
	

func _on_chaudron_area_entered(area):
	if !$Timer.is_stopped() and area.max >= area.fill +5:
		area.fill += 5 # Replace with function body.


#called if start is pressed, set timer and instanciate tubes
func _on_button_pressed():
	$Button.hide() #hide start
	$Button3.hide()
	#instantiate tubes	
	#set timer
	$TEXT/time.text = str(round($Timer.time_left))
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
		get_tree().reload_current_scene()


func _on_button_3_pressed():
	GlobalVar.to_game_list()
