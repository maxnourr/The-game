extends Node

var move = false
var rng = RandomNumberGenerator.new()

var current_number = 1

var goal1 = 0
var goal2 = 0
var red_number = 0
var green_number = 0
var blue_number = 0
var pink_number = 0

static var time = 15

func _ready():
	$Button3/Label.set_text("coins : " + str(GlobalVar.coins))
	$Button2.hide() #no restart
	$Timer.wait_time = time #set timer
	
	if GlobalVar.on_hard_core:
		_on_button_pressed()



func random():
	blue_number = randi_range(1,12)
	pink_number = randi_range(1,12)
	while pink_number == blue_number:
		pink_number = randi_range(1,12)
	$centrifuge.rotate(-PI/6*(blue_number-1))
	parent($blue,$centrifuge)
	$centrifuge/blue.global_position = $centrifuge.global_position + Vector2(180,0)
	$centrifuge/blue.visible = true
	$centrifuge.rotation = 0
	
	$centrifuge.rotate(-PI/6*(pink_number-1))
	parent($pink,$centrifuge)
	$centrifuge/pink.global_position = $centrifuge.global_position + Vector2(180,0)
	$centrifuge/pink.visible = true
	$centrifuge.rotation = 0
	
	goal1 = blue_number+6
	if goal1 > 12:
		goal1 -= 12
	goal2 =pink_number+6
	if goal2 > 12:
		goal2 -= 12
	
	if blue_number == goal2:
		goal1 = blue_number+3
		if goal1 > 12:
			goal1 -= 12
		goal2 = pink_number+3
		if goal2 > 12:
			goal2 -= 12
	#print("blue " + str(blue_number) + " pink " + str(pink_number) + " goal1 " + str(goal1)+ " goal2 " + str(goal2))
		
func sens_fleche():
	if $fleche.visible and current_number in [blue_number,pink_number]:
		$fleche.visible = false
	elif !$fleche.visible and not current_number in [blue_number,pink_number]:
		$fleche.visible = true
	if $fleche.remove == false and current_number in [red_number,green_number,blue_number,pink_number]:
		$fleche.remove = true
	elif $fleche.remove == true and not current_number in [red_number,green_number,blue_number,pink_number]:
		$fleche.remove = false
		
func verify():
	if (red_number == goal1  and green_number == goal2) or (red_number == goal2 and green_number == goal1):
		
		$ColorRect.color=Color(0.643, 1, 0.486)
		$TEXT/win_state.text = "you win!"
		move = false
		GlobalVar.win = true
		GlobalVar.coins +=1
		$Timer.stop()
		restart()

func _process(delta):
	
	var T = max(0,round($Timer.time_left))
		#update time
		
	#if timer running we update
	if not $Timer.is_stopped():
		$clock/time.text = str(max(0,T))
		#if time runs out (do not use signal because of malus
		if T == 0:
			$ColorRect.color=Color(1, 0.231, 0.231)
			$TEXT/win_state.text = "haha looser"
			restart()
	
func restart(): 
	
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
		$TEXT/explanation.text = "cleaning is the key !"
		

func _on_button_pressed():
	$Button.hide() #hide start	
	$Button3.hide()
	#set timer
	$clock.visible = true
	$clock/time.text = str(round($Timer.time_left))
	move = true
	random()
	sens_fleche()
	$Timer.start()

#called if restart pressed
func _on_button_2_pressed():
	if GlobalVar.win:
		time = max(5,time-5)
	if GlobalVar.on_randon == true:
		GlobalVar.pass_game()
	else:
		GlobalVar.to_load(GlobalVar.game[11])
		

func _on_button_3_pressed():
	GlobalVar.to_game_list()

func _on_up_pressed():
	if move:
		if current_number <12:
			current_number += 1
		else:
			current_number = 1
		$centrifuge.rotate(-PI/6)
		sens_fleche()
	

func _on_down_pressed():
	if move:
		if current_number >1:
			current_number -= 1
		else:
			current_number = 12
		$centrifuge.rotate(PI/6)
		sens_fleche()
	

func _on_red_pressed():
	if move and current_number not in [green_number,blue_number,pink_number]:
		$red.visible = true
		parent($red,$centrifuge)
		red_number = current_number
		$tubes/red.visible = false
		$centrifuge/red.global_position = $centrifuge.global_position + Vector2(180,0)
		sens_fleche()
		verify()

func _on_green_pressed():
	if move and current_number not in [red_number,blue_number,pink_number]:
		$green.visible = true
		parent($green,$centrifuge)
		green_number = current_number
		$tubes/green.visible = false
		$centrifuge/green.global_position = $centrifuge.global_position + Vector2(180,0)
		sens_fleche()
		verify()

func _on_red_button_pressed():
	if move and current_number==red_number:
		$centrifuge/red.visible = false
		parent($centrifuge/red,self)
		red_number = 0
		$tubes/red.visible = true

func _on_green_button_pressed():
	if move and current_number==green_number:
		$centrifuge/green.visible = false
		parent($centrifuge/green,self)
		green_number = 0
		$tubes/green.visible = true

func parent(child: Node, new_parent: Node):
	var old_parent = child.get_parent()
	old_parent.remove_child(child)
	new_parent.add_child(child)

