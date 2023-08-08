extends Node

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Label.set_text("coins : " + str(GlobalVar.coins))

func _on_minigame_1_pressed():
	GlobalVar.to_load(GlobalVar.game[0])


func _on_minigame_2_pressed():
	GlobalVar.to_load(GlobalVar.game[1])


func _on_minigame_3_pressed():
	GlobalVar.to_load(GlobalVar.game[2])


func _on_minigame_4_pressed():
	GlobalVar.to_load(GlobalVar.game[3])


func _on_minigame_5_pressed():
	GlobalVar.to_load(GlobalVar.game[4])


func _on_on_random_pressed():
	GlobalVar.on_randon = true
	GlobalVar.pass_game()

