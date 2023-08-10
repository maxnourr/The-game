extends Area2D
var inside = false
var filled = 0;
var required = 500
var moving = false

var empty = preload("res://minijeu_6/figures/Bechervide.png")
var half = preload("res://minijeu_6/figures/Becherhalf.png")
var fill = preload("res://minijeu_6/figures/Becherultrafilled@4x.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite2D.set_texture(empty)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if inside and moving:
		filled += 0.5
	
	if filled >= required/2 and $Sprite2D.texture == empty:
		$Sprite2D.set_texture(half)
	elif filled >= required:
		$Sprite2D.set_texture(fill)
	$Label.text = str(roundi(filled))
	$Label.text += "/"
	$Label.text += str(required)
	
	



func _on_area_entered(area):
	inside = true


func _on_area_exited(area):
	inside = false
