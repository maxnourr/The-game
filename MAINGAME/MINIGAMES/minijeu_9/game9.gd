extends Node

var rng = RandomNumberGenerator.new()
var firstrandom
var secondrandom
var move = false
var velo = false
var intermediate = 0
static var time = 15
var waiting_time = 0
var to_wait = 300


func _ready():
	$Button3/Label.set_text("coins : " + str(GlobalVar.coins))
	$Button2.hide() #no restart
	$Timer.wait_time = time #set timer  
	
	if GlobalVar.on_hard_core:
		_on_button_pressed()



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
			if $tube.position.x >= (firstrandom - 5) and $tube.position.x <= (firstrandom + 5) and move:
				$velocity.visible = true
				move = false
				velo = true
				$velocity/RigidBody2D.setter = true	
		
		if velo:
			$tube.swing($velocity/RigidBody2D.currentVelocity)
			if $velocity/RigidBody2D.currentVelocity >40 and $velocity/RigidBody2D.currentVelocity <60 :
				waiting_time += 1
				$velocity/RigidBody2D/text.visible = true
			else:
				$velocity/RigidBody2D/text.visible = true
				waiting_time = 0
			if waiting_time >= to_wait:
				$ColorRect.color=Color(0.643, 1, 0.486)
				$TEXT/win_state.text = "you win!"
				GlobalVar.win = true
				GlobalVar.coins +=1
				$Timer.stop()
				restart()
			
		$clock/time.text = str(max(0,T))
		#if time runs out (do not use signal because of malus
		if T == 0:
			$ColorRect.color=Color(1, 0.231, 0.231)
			$TEXT/win_state.text = "haha looser"
			move = false
			$Timer.stop()
			restart()

func restart(): 
	$velocity/RigidBody2D.setter = false
	$TEXT/explanation.text = "Vortex are commonly used in the lab\n speed and waiting time are important\n depending of your goal"
	if GlobalVar.on_hard_core:
		_on_button_2_pressed()
	else:
		if not GlobalVar.win:
			$Button2.set_text("Restart")
		else:
			$Button2.set_text("Continue")
		$Button2.show()
		$Button3.show()
		$Button3/Label.set_text("coins : "+str(GlobalVar.coins))
	


func _on_button_pressed():
	$screen.hide()
	# les valeurs randoms et les positions sont des nombres fixes de pixel, à changer
	#Si on veut une taille d'écran variable.
	firstrandom = rng.randf_range(100, 800)
	secondrandom = rng.randf_range(100, 1052)
	$tube.position.y = 280
	$vortex.position.x = firstrandom
	$tube.position.x = secondrandom
	move = true
	$Button.hide() #hide start	
	$Button3.hide()
	#set timer
	$clock.visible = true
	$clock/time.text = str(round($Timer.time_left))
	
	$Timer.start()


#called if restart pressed
func _on_button_2_pressed():
	if GlobalVar.win:
		time = max(2,time-1) 
		to_wait = min(500,to_wait+50) 
	if GlobalVar.on_randon == true:
		GlobalVar.pass_game()
	else:
		GlobalVar.to_load(GlobalVar.game[8])


func _on_button_3_pressed():
	reset()
	GlobalVar.to_game_list()
	
func reset():
	time = 15
	to_wait = 300
	
