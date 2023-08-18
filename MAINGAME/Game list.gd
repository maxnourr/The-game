extends Control

func _ready():
	if GlobalVar.first_open:
		GlobalVar.load_game()
		GlobalVar.first_open = false
	else:
		GlobalVar.save_game()
	
	Global.music_menu()

			
func _on_game_1_pressed():
	Global.button_sound()
	Global.music_game1()
	GlobalVar.to_load(GlobalVar.game[0])

func _on_game_2_pressed():
	Global.button_sound()
	Global.music_game1()
	GlobalVar.to_load(GlobalVar.game[1])

func _on_game_3_pressed():
	Global.button_sound()
	Global.music_game1()
	GlobalVar.to_load(GlobalVar.game[2])
	
func _on_game_4_pressed():
	Global.button_sound()
	Global.music_game1()
	GlobalVar.to_load(GlobalVar.game[3])
	
func _on_game_5_pressed():
	Global.button_sound()
	Global.music_game1()
	GlobalVar.to_load(GlobalVar.game[4])
	
func _on_game_6_pressed():
	Global.button_sound()
	Global.music_game1()
	GlobalVar.to_load(GlobalVar.game[5])

func _on_game_7_pressed():
	Global.button_sound()
	Global.music_game1()
	GlobalVar.to_load(GlobalVar.game[6])

func _on_game_8_pressed():
	Global.button_sound()
	Global.music_game1()
	GlobalVar.to_load(GlobalVar.game[7])

func _on_game_9_pressed():
	Global.button_sound()
	Global.music_game1()
	GlobalVar.to_load(GlobalVar.game[8])

func _on_game_10_pressed():
	Global.button_sound()
	Global.music_game1()
	GlobalVar.to_load(GlobalVar.game[9])

func _on_game_11_pressed():
	Global.button_sound()
	Global.music_game1()
	GlobalVar.to_load(GlobalVar.game[10])

func _on_game_12_pressed():
	Global.button_sound()
	Global.music_game1()
	GlobalVar.to_load(GlobalVar.game[11])

func _on_game_13_pressed():
	Global.button_sound()
	Global.music_game1()
	GlobalVar.to_load(GlobalVar.game[12])

func _on_game_14_pressed():
	Global.button_sound()
	Global.music_game1()
	GlobalVar.to_load(GlobalVar.game[13])
	
func _on_game_15_pressed():
	Global.button_sound()
	Global.music_game1()
	GlobalVar.to_load(GlobalVar.game[14])	

func _on_random_pressed():
	Global.button_sound()
	Global.music_game2()
	GlobalVar.on_randon = true
	GlobalVar.pass_game()
	
func _on_randomhard_pressed():
	Global.button_sound()
	Global.music_game2()
	GlobalVar.on_hard_core = true
	_on_random_pressed()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Label.set_text("coins : " + str(GlobalVar.coins))

func _on_return_pressed():
	Global.button_sound()
	GlobalVar.save_game()
	GlobalVar.to_menu()
	
