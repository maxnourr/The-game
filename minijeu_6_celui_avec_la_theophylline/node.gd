extends Node
var win = false
var required = 130
# C EST GIGA GETTHO ATTENTION
# eN GROS LE SCRIPTE AREA2D C EST POUR L ELEMENT SALT
# ET LE SCRIPTE TUBE C EST POUR L ELEMENT AREA2D
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $Area2D.filled >= $Area2D.required:
		win = true
		$Label.text = "You win"

