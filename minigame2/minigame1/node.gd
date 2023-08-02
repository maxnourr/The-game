extends Node

var rng = RandomNumberGenerator.new()
var firstrandom
var secondrandom
var move = true
# Called when the node enters the scene tree for the first time.
func _ready():
	firstrandom = rng.randf_range(200, 1000.0)
	secondrandom = rng.randf_range(0, 1000.0)
	$bloc.position.y = 20
	$bloc2.position.y = 220
	$bloc3.position.y = 420
	$bloc.position.x = firstrandom
	$bloc2.position.x = secondrandom
	$bloc3.position.x = firstrandom
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var mouse_x = get_viewport().get_mouse_position().x
	if move:
		$bloc2.position.x = mouse_x
	if($bloc2.position.x >= (firstrandom - 5) and $bloc2.position.x <= (firstrandom + 5)):
		$CanvasLayer/Label.text = "you win!"
		move = false
	pass
