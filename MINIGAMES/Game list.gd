extends Control

var width = 0
var height =0

func _ready():
	
	if GlobalVar.on_randon == true:
		if not GlobalVar.first and GlobalVar.win:
			GlobalVar.score +=1
		GlobalVar.win = false
		GlobalVar.first = true
		GlobalVar.on_randon = false
		GlobalVar.on_hard_core = false
		final_speed_run()


			
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
	
func _on_randomhard_pressed():
	GlobalVar.on_hard_core = true
	_on_random_pressed()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Label.set_text("coins : " + str(GlobalVar.coins) + "\nmaximum score : " + str(GlobalVar.max_score))

func _on_return_pressed():
	GlobalVar.to_menu()


func _on_return_game_pressed():
	$VBoxContainer.visible=true
	$VBoxContainer2.visible=true
	$VBoxContainer3.visible=true
	$VBoxContainer4.visible=true
	$Return_game.visible=false
	$speed_run_end.visible=false
	
func final_speed_run():
	$speed_run_end.set_text("Congrats, your score is " + str(GlobalVar.score))
	if GlobalVar.score > GlobalVar.max_score:
		GlobalVar.max_score = GlobalVar.score
	$VBoxContainer.visible=false
	$VBoxContainer2.visible=false
	$VBoxContainer3.visible=false
	$VBoxContainer4.visible=false
	$Return_game.visible=true
	$speed_run_end.visible=true
	
