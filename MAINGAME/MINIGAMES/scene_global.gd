extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	$TEXT/explanation.visible = false
	$menu/Label.set_text("coins : " + str(GlobalVar.coins))
	$restart.hide() #no restart

	var game = load(GlobalVar.game_to_load).instantiate()
	game.name = "game"
	add_child(game)
	move_child($game,2)
	
	$game.on_ready()
	$Timer.wait_time = $game.time #set timer
	$start/Label.text = $game.game_intro
	$start/Label2.text = $game.game_rules
	if GlobalVar.on_randon:
		_on_start_pressed()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	$TEXT/win_state.text = $game.win_state
	if GlobalVar.win == 1:
		Global.correct()
		$Timer.stop()
		$screen.show()
		$screen.color =Color(0.643, 1, 0.486)
		restart()
	if GlobalVar.win == -1:
		$Timer.stop()
		$screen.show()
		$screen.color = Color(1, 0.231, 0.231,0.7)
		restart()
	#if timer running we update
	if not $Timer.is_stopped():
		
		#if malus we remove some time
		#do not successed to remove time from timer
		var T = max(0,round($Timer.time_left))
		if $game.malus:
			T = max(0,T-3) 
		
		#update time
		$clock.visible = true
		$clock/time.text = str(max(0,T))
		
		$game.process(delta)
		#if time runs out (do not use signal because of malus
		if T == 0:
			$screen.show()
			$screen.color = Color(1, 0.231, 0.231,0.7)
			$game.lose()
			restart()

func restart(): 
	if GlobalVar.on_hard_core:
		_on_restart_pressed()
	else:
		if GlobalVar.win ==-1:
			$restart.set_text("Restart")
		else:
			$restart.set_text("Continue")
		$restart.show() # show restart
		$menu.show()
		$menu/Label.set_text("coins : "+str(GlobalVar.coins))
		
		$TEXT/explanation.visible = true
		$TEXT/explanation.text = $game.restart()
#called if start is pressed, set timer and instanciate tubes
func _on_start_pressed():
	$TEXT/explanation.visible = false
	$screen.hide()
	$start.hide() #hide start
	$menu.hide()
	
	$game.start()
	#set timer
	$clock/time.text = str(round($Timer.time_left))
	$Timer.start()

#called if restart pressed
func _on_restart_pressed():
	if GlobalVar.on_randon == true:
		GlobalVar.pass_game()
	else :
		GlobalVar.to_load(GlobalVar.game_to_load)


func _on_menu_pressed():
	$game.reset()
	GlobalVar.to_minigame_list()

