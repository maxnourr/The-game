extends CollisionShape2D



func _on_amp_area_entered(area):
	if PlayerVar.ampr == false:
		PlayerVar.win = 2
	
