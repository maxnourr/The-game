extends Area2D

var type = "trash"
static var nb_trash = 0
static var started = false

# Called when the node enters the scene tree for the first time.
func _ready():
	nb_trash += 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
