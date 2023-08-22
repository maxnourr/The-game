extends Area2D
var timer
var stuck
# Called when the node enters the scene tree for the first time.
func _ready():
	timer = 100


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if PlayerVar.Mucus ==true:
		PlayerVar.SPAC = true
		timer = 100
	if PlayerVar.Mucus ==false:
		timer += -0.5
	if timer <= 0:
		PlayerVar.SPAC = false
		stuck = false
	#print(stuck)
	
	if stuck == true:
		PlayerVar.moving = false
	if stuck == false:
		PlayerVar.moving = true
	

func _on_area_entered(area):
	if area.name == "bacteria" and PlayerVar.SPAC == true:
		stuck = true
		
		
