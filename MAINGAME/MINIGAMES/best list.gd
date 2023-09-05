extends Control

var label = preload("res://MINIGAMES/best_player.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	
	for i in GlobalVar.best_player.size():
		var Person = label.instantiate()
		Person.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		Person.text =str(i+1)+". "+GlobalVar.best_player[i]+ " with score " + str(GlobalVar.best_score[i])
		$VBoxContainer.add_child(Person)
		$VBoxContainer.move_child($VBoxContainer/Return_game,i+1)

func _on_return_game_pressed():
	Global.button_sound()
	GlobalVar.to_minigames()
