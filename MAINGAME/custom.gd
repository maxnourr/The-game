extends Node
var waiting = 0

func _ready():
	pass

func _process(delta):
	waiting +=1
	if waiting >=100:
		waiting = 0
		if $bacteria/flagel.visible == true:
			$bacteria/flagel.visible = false
			$bacteria/flagel2.visible = true
		else:
			$bacteria/flagel.visible = true
			$bacteria/flagel2.visible = false

func _on_exit_button_down():
	Global.click()
	GlobalVar.to_game_list()



func _on_green_pressed():
	$bacteria.change_color(Color(1, 1, 1))


func _on_red_pressed():
	$bacteria.change_color(Color(0.787, 0.001, 0.891))

func _on_yellow_pressed():
	$bacteria.change_color(Color(1, 0.945, 0))


func _on_blue_pressed():
	$bacteria.change_color(Color(0.208, 0.627, 0.847))


func _on_c_pressed():
	if !$bacteria.logo or $bacteria/"48C".visible:
		$bacteria/"48C".visible = !$bacteria/"48C".visible
		$bacteria.logo = !$bacteria.logo


func _on_thessaloniki_pressed():
	if !$bacteria.logo or $bacteria/collab.visible:
		$bacteria/collab.visible = !$bacteria/collab.visible
		$bacteria.logo = !$bacteria.logo
