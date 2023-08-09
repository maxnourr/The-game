extends Area2D

var type = "eye"
var good = preload("figures/Yeuxclairs.png")
var bad = preload("figures/Yeuxrouges.png")

func set_type(T):
	if T == "good":
		$Sprite2D.set_texture(good)
	elif T == "bad":
		$Sprite2D.set_texture(bad)
