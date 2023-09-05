extends Area2D
var timer
var stuck
var first = true
# Called when the node enters the scene tree for the first time.
func _ready():
	timer = 100


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	#if PlayerVar.Mucus ==true:
	#	PlayerVar.SPAC = true
	#	timer = 100.
	if stuck and timer > 0:
		timer += -0.2
	if timer <= 0 and stuck:
		if first:
			PlayerVar.SPAC = false
			first = false
		elif PlayerVar.SPAC == true:
			PlayerVar.win = 2
		else:
			stuck = false
	#print(stuck)
	
	if stuck == true:
		PlayerVar.moving = false
	if stuck == false:
		PlayerVar.moving = true
	

func _on_area_entered(area):
	if area.name == "bacteria" and PlayerVar.SPAC == true:
		stuck = true
		timer = 100
		
		
