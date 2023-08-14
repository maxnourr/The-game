extends Node
static var nb_food = 3
var count_down_time = 10
var linktube = preload("res://minijeu_11/cadmium.tscn") #to create new tube
var rng = RandomNumberGenerator.new()		
var x = 0
var y = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$Button3/Label.set_text("coins : " + str(GlobalVar.coins))
	$Button2.hide() #no restart
	$Timer.wait_time = count_down_time  #set timer
	$cadmium.set_player($player)
	x = range($player.position.x -100,$player.position.x -50) + range($player.position.x +50,$player.position.x +100)
	y = range($player.position.y -70,$player.position.y -20) + range($player.position.y +20,$player.position.y +70)
	
	if GlobalVar.on_hard_core:
		_on_button_pressed()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	var T = max(0,round($Timer.time_left))
		#update time
		
	#if timer running we update
	if not $Timer.is_stopped():
		
		
		$clock/time.text = str(max(0,T))
		
		if $cadmium.score == nb_food:
			$ColorRect.color=Color(0.643, 1, 0.486)
			$TEXT/win_state.text = "You win"
			$player.set_state("happy")
			GlobalVar.win = true
			GlobalVar.coins +=1
			$Timer.stop()
			restart()
	
		#if time runs out (do not use signal because of malus
		if T == 0:
			$ColorRect.color=Color(1, 0.231, 0.231)
			$TEXT/win_state.text = "haha looser"
			$Timer.stop()
			restart()
			

func restart(): 
	$cadmium.destroy()
	$player.running = false
	$cadmium.running = false
	
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
		$TEXT/explanation.text = "go protect the body !"


func _on_button_pressed():
	$Button.hide() #hide start	
	$Button3.hide()
	#set timer
	$cadmium.visible = true
	$cadmium.position.x = x[randi() % x.size()]
	$cadmium.position.y = y[randi() % y.size()]
	
	if nb_food >1:
		for n in nb_food-1:
			var food = linktube.instantiate()
			randomize()
			food.position.x = x[randi() % x.size()]
			food.position.y = y[randi() % y.size()]
			food.set_player($player)
			add_child(food)
	$cadmium.running = true
	$player.running = true
	$clock.visible = true
	$clock/time.text = str(round($Timer.time_left))
	$Timer.start()

#called if restart pressed
func _on_button_2_pressed():
	if GlobalVar.win:
		nb_food += 2
	if GlobalVar.on_randon == true:
		GlobalVar.pass_game()
	else:
		get_tree().reload_current_scene()

func _on_button_3_pressed():
	GlobalVar.to_game_list()

func _on_border_area_exited(area):
	if area.type == "cadmium" and area.visible :
		$border/CollisionShape2D.set_deferred("disabled", true)
		$ColorRect.color=Color(1, 0.231, 0.231)
		$TEXT/win_state.text = "haha looser"
		$Timer.stop()
		restart()
