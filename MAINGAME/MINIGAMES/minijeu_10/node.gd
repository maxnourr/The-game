extends Node

#for all game
var time = 15
var malus = false #change the time if activated
var win_state = ""
var run = false

var game_intro = "add the right amount on each tube\nbe careful not to put too much !"
var game_rules = "put the syringe in the becher to fill it\nclick in the tube to fill them"

func on_ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func process(delta):
	
			
	$tube.check($seringue_true.fill)
	$tube2.check($seringue_true.fill)
	$tube3.check($seringue_true.fill)
		
	if $tube.score == $tube.required_score:
		win()
			
	if $tube.lose == true or $tube2.lose == true or $tube3.lose == true:
		lose()
	
func restart(): 
	$tube.destroy()
	return "when you add a liquid in a tube with bacterias\n you can't take it back\n you can't use the same tip two times\n you can't put it back in the becher"
	
	

func _on_chaudron_area_entered(area):
	if $seringue_true.running == true and area.max >= area.fill +5:
		area.fill += 5 # Replace with function body.


#called if start is pressed, set timer and instanciate tubes
func start():
	$seringue_true.running = true
	$tube/Label.visible = true
	$tube2/Label.visible = true
	$tube3/Label.visible = true
	

func reset():
	$tube.destroy()
	$tube.max = 2.1

#called if restart pressed
func win():
	$seringue_true.running = false
	GlobalVar.win = 1
	GlobalVar.coins +=1
	$tube.max = min(5.1,$tube.max+1)
	win_state = "you win"
	
func lose():
	$seringue_true.running = false
	GlobalVar.win = -1
	win_state = "haha looser"
