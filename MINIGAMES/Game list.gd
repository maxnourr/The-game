extends Control

var width = 0
var height =0

func _ready():
	pass

			
func _on_game_1_pressed():
	GlobalVar.to_load(GlobalVar.game[0])

func _on_game_2_pressed():
	GlobalVar.to_load(GlobalVar.game[1])

func _on_game_3_pressed():
	GlobalVar.to_load(GlobalVar.game[2])
	
func _on_game_4_pressed():
	GlobalVar.to_load(GlobalVar.game[3])
	
func _on_game_5_pressed():
	GlobalVar.to_load(GlobalVar.game[4])
	
func _on_game_6_pressed():
	GlobalVar.to_load(GlobalVar.game[5])

func _on_game_7_pressed():
	GlobalVar.to_load(GlobalVar.game[6])

func _on_game_8_pressed():
	GlobalVar.to_load(GlobalVar.game[7])

func _on_game_9_pressed():
	GlobalVar.to_load(GlobalVar.game[8])

func _on_game_10_pressed():
	GlobalVar.to_load(GlobalVar.game[9])

func _on_game_11_pressed():
	GlobalVar.to_load(GlobalVar.game[10])

func _on_game_12_pressed():
	GlobalVar.to_load(GlobalVar.game[11])

func _on_game_13_pressed():
	GlobalVar.to_load(GlobalVar.game[12])

func _on_game_14_pressed():
	GlobalVar.to_load(GlobalVar.game[13])
	
func _on_game_15_pressed():
	GlobalVar.to_load(GlobalVar.game[14])	

func _on_random_pressed():
	GlobalVar.on_randon = true
	GlobalVar.pass_game()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Label.set_text("coins : " + str(GlobalVar.coins))

func _on_return_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")


