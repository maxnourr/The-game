extends Node

var won: bool=false
var time = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	$Button3/Label.set_text("coins : " + str(GlobalVar.coins))
	$Button2.hide() #no restart
	$Timer.wait_time = time #set timer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not $Timer.is_stopped():
		var T = max(0,round($Timer.time_left))
		
		$TEXT/time.text = str(max(0,T))
		
		if T == 0:
			$Timer.stop()
			won=false
			$ColorRect.color=Color(1, 0.231, 0.231)
			$TEXT/win_state.set_text("haha looser")
			restart()
			
func _on_plate_area_entered(area):
	if area.type=="bad":
		$Timer.stop()
		$Plate.texture("sad")
		won=false
		$ColorRect.color=Color(1, 0.231, 0.231)
		$TEXT/win_state.set_text("haha looser")
		restart()
		
	elif area.type=="good":
		$Timer.stop()
		won=true
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
	$Timer.start()

#called if restart pressed
func _on_button_2_pressed():
	if won:
		pass
	if GlobalVar.on_randon == true and won:
		GlobalVar.pass_game()
	else:
		get_tree().reload_current_scene()


func _on_button_3_pressed():
	GlobalVar.to_game_list()
	
func restart(): 
	$LB.running = false
	$Pizza.running = false
	if won == false:
		$Button2.set_text("Restart")
	else:
		$Button2.set_text("Continue")
	$Button2.show() # show restart
	$Button3.show()
	$Button3/Label.set_text("coins : "+str(GlobalVar.coins))