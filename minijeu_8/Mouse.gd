extends Area2D

var score = 0

func _ready():
	set_pickable(true)

func _input(event):
	if event is InputEventMouseMotion:
		position = event.position

func _on_area_entered(area):
	#if body.has_method("sprite_disappear()"):
	if area.type == "dirt":
		area.sprite_disappear()
		score += 1
