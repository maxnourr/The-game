extends RigidBody2D

@export var min_speed = 150.0
@export var max_speed = 250.0

func _ready():
	pass

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
