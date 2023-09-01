extends Node
var time = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	$Button3/Label.set_text("coins : " + str(GlobalVar.coins))
	$Button2.hide() #no restart
	$Timer.wait_time = time #set timer
	
	if GlobalVar.on_hard_core:
		_on_button_pressed()


func restart(): 
	$TEXT/explanation.text = "technically you have several pipettes\n for different amount\n and you can fix the amount you need\n for more precision"
	
	$liquide.running = false
	
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
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	var T = max(0,round($Timer.time_left))
		#update time
	#if timer running we update
	if not $Timer.is_stopped():
		$clock/time.text = str(max(0,T))
		#if time runs out (do not use signal because of malus
		if T == 0:
			$BackGround.color=Color(1, 0.231, 0.231)
			$TEXT/win_state.text = "haha looser"
			restart()
		

		if $liquide.waiting >= 30:
			GlobalVar.win = true
			$BackGround.color=Color(0.643, 1, 0.486)
			$TEXT/win_state.text = "you win"
			GlobalVar.coins +=1
			$Timer.stop()
			restart()

func _on_button_pressed():
	$screen.hide()
	$Button.hide() #hide start	
	$Button3.hide()
	#set timer
	$clock.visible = true
	$clock/time.text = str(round($Timer.time_left))
	$liquide.running = true
	$Timer.start()

#called if restart pressed
func _on_button_2_pressed():
	if GlobalVar.win :
		$liquide.speed = min(10, $liquide.speed+1)
	if GlobalVar.on_randon == true:
		GlobalVar.pass_game()
	else:
		GlobalVar.to_load(GlobalVar.minigame[4])


func _on_button_3_pressed():
	reset()
	GlobalVar.to_minigame_list()
	
func reset():
	$liquide.speed = 1
