extends Node
var count_down_time = 10
var lose = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$Button3/Label.set_text("coins : " + str(GlobalVar.coins))
	$Button2.hide() #no restart
	$Timer.wait_time = count_down_time  #set timer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	
	var T = max(0,round($Timer.time_left))
		#update time
		
	#if timer running we update
	if not $Timer.is_stopped():
		
		$food.run($player,delta)
		$food2.run($player,delta)
	
		$TEXT/time.text = str(max(0,T))
		#if time runs out (do not use signal because of malus
		if T == 0:
			lose = true
			$TEXT/win_state.text = "haha looser"
			$Timer.stop()
			restart()
	
		if $food.score == $food.max and lose == false:
			$TEXT/win_state.text = "You win"
			GlobalVar.coins +=1
			$Timer.stop()
			restart()

func restart(): 
	$player.running = false
	if lose:
		$Button2.set_text("Restart")
	else:
		$Button2.set_text("Continue")
	$Button2.show() # show restart
	$Button3.show()
	$Button3/Label.set_text("coins : "+str(GlobalVar.coins))
	$TEXT/explanation.text = "cleaning is the key !"


func _on_button_pressed():
	$Button.hide() #hide start	
	$Button3.hide()
	#set timer
	$player.running = true
	$TEXT/time.text = str(round($Timer.time_left))
	$Timer.start()

#called if restart pressed
func _on_button_2_pressed():
	if not lose :
		count_down_time = max(4,count_down_time-2)
	if GlobalVar.on_randon == true and not lose:
		GlobalVar.pass_game()
	else:
		get_tree().reload_current_scene()

func _on_button_3_pressed():
	GlobalVar.to_menu()
