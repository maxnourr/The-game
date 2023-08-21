extends Area2D

func _on_area_entered(area):
	PlayerVar.win = 1
	PlayerVar.moving = false
