extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func set_text(text):
	$explications.text = text
	
func display(do):
	if do :
		$explications.visible = true
	else:
		$explications.visible = false
		

func _on_mouse_entered():
	display(true)

func _on_mouse_exited():
	display(false)
