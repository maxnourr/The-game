extends Node
static var time = 20
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	$menu/Label.set_text("coins : " + str(GlobalVar.coins))
	$restart.hide() #no restart
	$Timer.wait_time = time #set timer
	
	if GlobalVar.on_hard_core:
		_on_start_pressed()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	#update time
	var T = max(0,round($Timer.time_left))
		
	#if the timer is running we update
	if not $Timer.is_stopped():
		
		$clock/time.text = str(max(0,T))
	
		#if time runs out, you lose
		if T == 0:
			$ColorRect.color=Color(1, 0.231, 0.231)
			$TEXT/win_state.text = "haha looser"
			$player.set_state("angry")
			$Timer.stop()
			restart()
			

func restart(): 
	#you stop moving! 
	$player.running = false
	#add explanation
	$TEXT/explanation.text = "add a nice explanation here"
	if GlobalVar.on_hard_core:
		_on_restart_pressed()
	else:
		if not GlobalVar.win:
			$restart.set_text("Restart")
		else:
			$restart.set_text("Continue")
		$restart.show() # show restart
		$menu.show()
		$menu/Label.set_text("coins : "+str(GlobalVar.coins))


func _on_start_pressed():
	$screen.hide()
	$start.hide() #hide start	
	$menu.hide()
	
	#the player can move
	$player.running = true
	$clock.visible = true
	$clock/time.text = str(round($Timer.time_left))
	$Timer.start()

#called if restart pressed
func _on_restart_pressed():
	#if you win, you make it harder ;)
	if GlobalVar.win:
		time = max(10,time-2)
	#survival mode = pass randomly another game
	if GlobalVar.on_randon == true:
		GlobalVar.pass_game()
	else: #else redu this game
		get_tree().reload_current_scene()

func _on_menu_pressed():
	reset()
	GlobalVar.to_minimenu()
	
func reset():
	time = 20

# if you enter the win area, you win
func _on_win_area_area_entered(area):
	$ColorRect.color=Color(0.643, 1, 0.486)
	$TEXT/win_state.text = "You win"
	GlobalVar.win = true
	GlobalVar.coins +=1
	
	$Timer.stop()
	restart()

# if you enter the lose area, you lose
func _on_lose_area_area_entered(area):
	$ColorRect.color=Color(1, 0.231, 0.231)
	$TEXT/win_state.text = "haha looser"
	$player.set_state("angry")
	$Timer.stop()
	restart()
