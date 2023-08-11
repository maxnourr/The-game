extends Node

var rng = RandomNumberGenerator.new()
var firstrandom
var secondrandom
var move = false
var win = false
var intermediate = 0
static var time = 5


func _ready():
	$Button3/Label.set_text("coins : " + str(GlobalVar.coins))
	$Button2.hide() #no restart
	$Timer.wait_time = time #set timer  


func _process(delta):
	
	var mouse_x = get_viewport().get_mouse_position().x
	# permet de connaître les coordonnées en x de la souris
	
	var T = max(0,round($Timer.time_left))
			#update time
	#if timer running we update
	if not $Timer.is_stopped():
	
		#permet de bouger le rectangle, c'est là que la variable move prend son sens
		if move :
			$tube.position.x = mouse_x
			intermediate = $tube.position.x
		else:
			$tube.position.x = intermediate
			
		if($tube.position.x >= (firstrandom - 5) and $tube.position.x <= (firstrandom + 5)) :
			move = false
			$tube.position.x 
			$RigidBody2D.setter = true	
			if ($RigidBody2D.currentVelocity > 50) :
				$ColorRect.color=Color(0.643, 1, 0.486)
		
				$TEXT/win_state.text = "you win!"
				win = true
				GlobalVar.coins +=1
				$Timer.stop()
				restart()
			
		$TEXT/time.text = str(max(0,T))
		#if time runs out (do not use signal because of malus
		if T == 0:
			$ColorRect.color=Color(1, 0.231, 0.231)
			$TEXT/win_state.text = "haha looser"
			move = false
			$Timer.stop()
			restart()

func restart(): 
	$RigidBody2D.setter = false
	if not win:
		$Button2.set_text("Restart")
		$TEXT/explanation.text = "Too slow"
	else:
		$Button2.set_text("Continue")
		$TEXT/explanation.text = "Good job"
	$Button2.show()
	$Button3.show()
	$Button3/Label.set_text("coins : "+str(GlobalVar.coins))
	


func _on_button_pressed():
	
	# les valeurs randoms et les positions sont des nombres fixes de pixel, à changer
	#Si on veut une taille d'écran variable.
	firstrandom = rng.randf_range(100, 1052)
	secondrandom = rng.randf_range(100, 1052)
	$vortex.position.y = 350
	$tube.position.y = 300
	$vortex.position.x = firstrandom
	$tube.position.x = secondrandom
	move = true
	$Button.hide() #hide start	
	$Button3.hide()
	#set timer
	$TEXT/time.text = str(round($Timer.time_left))
	
	$Timer.start()


#called if restart pressed
func _on_button_2_pressed():
	if win :
		time = max(2,time-1) 
	if GlobalVar.on_randon == true and win == true:
		GlobalVar.pass_game()
	else:
		get_tree().reload_current_scene()


func _on_button_3_pressed():
	GlobalVar.to_game_list()
	
