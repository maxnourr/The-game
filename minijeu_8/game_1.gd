extends Node2D
static var score = 0

func _on_area_entered(area):
	hide()
	score +=1
	$CollisionShape2D.set_deferred("disabled",true)
	
