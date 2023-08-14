extends Node

var rng = RandomNumberGenerator.new()
var firstrandom
var secondrandom
var move = false

#timer
static var time = 5

# deux valeurs randoms différentes, une qui est le goal et une qui est la valeur de départ
# move est là pour immobiliser le rectangle une fois la partie gagnée.
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
		$bloc2.position.x = mouse_x
		if($bloc2.position.x >= (firstrandom - 5) and $bloc2.position.x <= (firstrandom + 5)):
			$TEXT/win_state.text = "you win!"
			move = false
			GlobalVar.win = true
			GlobalVar.coins +=1
			$Timer.stop()
			restart()
			
		$TEXT/time.text = str(max(0,T))
		#if time runs out (do not use signal because of malus
		if T == 0:
			$TEXT/win_state.text = "haha looser"
			move = false
			$Timer.stop()
			restart()
	
func restart(): 
	if GlobalVar.on_hard_core:
		_on_button_2_pressed()
	else:
		if GlobalVar.win == false:
			$Button2.set_text("Restart")
		else:
			$Button2.set_text("Continue")
		$Button2.show()
		$Button3.show()
		$Button3/Label.set_text("coins : "+str(GlobalVar.coins))
		$TEXT/explanation.text = "congrats you tricked igem"


func _on_button_pressed():
	
	# les valeurs randoms et les positions sont des nombres fixes de pixel, à changer
	#Si on veut une taille d'écran variable.
	firstrandom = rng.randf_range(200, 1000.0)
	secondrandom = rng.randf_range(0, 1000.0)
	$bloc.position.y = 80
	$bloc2.position.y = 220
	$bloc3.position.y = 360
	$bloc.position.x = firstrandom
	$bloc2.position.x = secondrandom
	$bloc3.position.x = firstrandom
	
	move = true
	$Button.hide() #hide start	
	$Button3.hide()
	#set timer
	$TEXT/time.text = str(round($Timer.time_left))
	
	$Timer.start()


#called if restart pressed
func _on_button_2_pressed():
	if GlobalVar.win:
		time = max(1,time-1) 
	if GlobalVar.on_randon == true:
		GlobalVar.pass_game()
	else:
		get_tree().reload_current_scene()


func _on_button_3_pressed():
	GlobalVar.to_game_list()
