extends Area2D

var direction = 10
var aim = Vector2.ZERO
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if PlayerVar.Play:
	
		if PlayerVar.Interlekin:
		
			position.x += direction
	
			if position.x >= get_viewport().size.x:
				direction = -10
			if position.x <= 0:
				direction = 10
		
		if PlayerVar.Interlekin == false:
			aim.x = (PlayerVar.PlayerX - position.x)
			aim.y = (PlayerVar.PlayerY - position.y)
			aim = aim.normalized()
			position += aim * delta * 360


func _on_area_entered(area):
	PlayerVar.alive = false
	PlayerVar.win = 2
