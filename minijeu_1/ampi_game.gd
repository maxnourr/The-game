extends Node

#tubes
var linktube = preload("res://ampi.tscn")
var rng = RandomNumberGenerator.new()

#circle
var min_size = 0.5
var max_size = 1
var step = 0

#game
var lose = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$Button2.hide()
	$circle.scale.x = max(0,max_size)
	$circle.scale.y = $circle.scale.x
	step = max(0,(max_size - min_size)/$Timer.wait_time)
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if not $Timer.is_stopped():
		$TEXT/time.text = str(round($Timer.time_left))
		$circle.scale.x = max(min_size,$circle.scale.x - step*delta)
		$circle.scale.y = $circle.scale.x


func _on_timer_timeout():
	if lose == false:
		$TEXT/win_state.text = "haha looser"
	lose = true


func _on_bacterias_area_entered(area):
	if area.type == "AMPI":
		$Timer.stop()
		$TEXT/win_state.text = "you win"
		$Button2.show()
	elif area.type == "BLUE":
		$TEXT/win_state.text = "I'm blue didadudidaduda"
	elif area.type == "SOC":
		$TEXT/win_state.text = "Bacteria's happy ! malus time"   


func _on_button_pressed():
	$Button.hide()
	
	for n in 3:
		var tube = linktube.instantiate()
		add_child(tube)
		
		if n == 1:
			tube.set_type("AMPI") #need at least 1
		elif n == 2:
			tube.set_type("SOC")
		else:
			tube.set_type("BLUE")
		
		tube.position.x = rng.randf_range(25,get_viewport().size.x-25)
		while tube.position.x in range(get_viewport().size.x/2-200,get_viewport().size.x/2+200):
			tube.position.x = rng.randf_range(25,get_viewport().size.x-25)
		
		tube.position.y = rng.randf_range(100,get_viewport().size.y-100)
		while tube.position.y in range(get_viewport().size.y/2-200,get_viewport().size.y/2+200):
			tube.position.y = rng.randf_range(100,get_viewport().size.y-100)
		
	$TEXT/time.text = str(round($Timer.time_left))
	
	$Timer.start()


func _on_button_2_pressed():
	get_tree().reload_current_scene()
