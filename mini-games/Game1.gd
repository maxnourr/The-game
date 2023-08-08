extends Node

var sco = 0

func _ready():
	updateScoreLabel()    


func _process(delta):
	
	if sco != $MarginContainer/mouse.score:
		sco = $MarginContainer/mouse.score
		updateScoreLabel()
	#increaseScore()
	
	
func increaseScore():
	#score += points
	sco = $MarginContainer/mouse.score
	updateScoreLabel()

# Function to update the score text on the Label.
func updateScoreLabel():
	var labelNode = $MarginContainer/Scorelabel
	if sco >= 5:
		labelNode.text = "You win"
	else:
		labelNode.text = "Score: " + str(sco)

func _on_return_pressed():
	$MarginContainer/mouse.score = 0
	get_tree().change_scene_to_file("res://menu.tscn")
