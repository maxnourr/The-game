extends Node
static var nb_food = 1
var count_down_time = 10
var linktube = preload("res://minijeu_13/food.tscn") #to create new tube
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	$Button3/Label.set_text("coins : " + str(GlobalVar.coins))
	$Button2.hide() #no restart
	$Timer.wait_time = count_down_time  #set timer
	$food.set_player($player)
	
	if GlobalVar.on_hard_core:
		_on_button_pressed()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	var T = max(0,round($Timer.time_left))
		#update time
		
	#if timer running we update
	if not $Timer.is_stopped():
		
		if $food.score == nb_food :
			GlobalVar.win = true
			$ColorRect.color=Color(0.643, 1, 0.486)
			$TEXT/win_state.text = "You win"
			$player.set_state("happy")
			GlobalVar.coins +=1
			$Timer.stop()
			restart()
	
		$clock/time.text = str(max(0,T))
		#if time runs out (do not use signal because of malus
		if T == 0:
			$ColorRect.color=Color(1, 0.231, 0.231)
			$TEXT/win_state.text = "haha looser"
			$Timer.stop()
			restart()
			

func restart(): 
	$food.destroy()
	$player.running = false
	$food.running = false
	
	if GlobalVar.on_hard_core:
		_on_button_2_pressed()
	else:
		if GlobalVar.win == false:
			$Button2.set_text("Restart")
		else:
			$Button2.set_text("Continue")
		$Button2.show() # show restart
		$Button3.show()
		$Button3/Label.set_text("coins : "+str(GlobalVar.coins))
		$TEXT/explanation.text = "go protect the body !"


func _on_button_pressed():
	$Button.hide() #hide start	
	$Button3.hide()
	#set timer
	$food.visible = true
	$food.position.x = rng.randi_range(0,1152)
	$food.position.y = rng.randi_range(0,648)
		
	if nb_food >1:
		for n in nb_food-1:
			var food = linktube.instantiate()
			randomize()
			food.position.x = rng.randi_range(0,1152)
			food.position.y = rng.randi_range(0,648)
			food.set_player($player)
			add_child(food)
	$food.running = true
	$player.running = true
	$clock.visible = true
	$clock/time.text = str(round($Timer.time_left))
	$Timer.start()

#called if restart pressed
func _on_button_2_pressed():
	if GlobalVar.win :
		$food.speed = max(100,$food.speed-20)
		nb_food += 1
	if GlobalVar.on_randon == true:
		GlobalVar.pass_game()
	else:
		GlobalVar.to_load(GlobalVar.game[12])

func _on_button_3_pressed():
	GlobalVar.to_game_list()


