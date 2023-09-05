extends Node


#for all game
static var time = 15
var malus = false #change the time if activated
var win_state = ""
var run = false

var game_intro = "The centrifuge need to be equilibrated \nSo it will not break"
var game_rules = "But the tubes on the right places"

var move = false

var current_number = 1

var goal1 = 0
var goal2 = 0
var red_number = 0
var green_number = 0
var blue_number = 0
var pink_number = 0


func on_ready():
	pass


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
		win()

func process(delta):
	pass
	
func restart(): 
	return "the centrifuge goes very fast\n whithout being equilibrated, it can break"
	
		

func start():
	move = true
	random()
	sens_fleche()
	
func reset():
	time = 15

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

#called if restart pressed
func win():
	move = false
	time = max(5,time-5)
	GlobalVar.win = 1
	GlobalVar.coins +=1
	win_state = "you win"
	
func lose():
	move = false
	GlobalVar.win = -1
	win_state = "haha looser"
