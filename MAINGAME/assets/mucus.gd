extends Area2D
var stuck
var first = true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	#if PlayerVar.Mucus ==true:
	#	PlayerVar.SPAC = true
	#	timer = 100.
	if !$Timer.is_stopped():
		if !stuck:
			$Timer.stop()
		else:
			$Label.set_text(str(round($Timer.time_left)))
	#print(stuck)
	
	if stuck == true:
		PlayerVar.moving = false
	if stuck == false:
		PlayerVar.moving = true

	if first == false:
		if PlayerVar.SPAC == true:
			PlayerVar.win = 2
			$Label.set_text("too \nlong...")
		else:
			stuck = false
			$Label.set_text("")

func _on_area_entered(area):
	if area.name == "bacteria" and PlayerVar.SPAC == true:
		stuck = true
		$Timer.start()
		
		


func _on_timer_timeout():
	if stuck:
		PlayerVar.SPAC = false
		first = false
