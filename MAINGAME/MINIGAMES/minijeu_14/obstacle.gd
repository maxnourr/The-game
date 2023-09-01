extends Area2D
static var speed = 400.0
var fuite = Vector2.ZERO
static var touched = false
var type = "obstacle"
static var player = null
static var running = false

var normal = preload("figures/Mechant@4x.png")
var gfp = preload("figures/Mechantvert@4x.png")

func change(nom):
	if nom == "gfp":
		$Sprite2D.set_texture(gfp)
	else:
		$Sprite2D.set_texture(normal)


func set_player(P):
	player = P
# Called every frame. 'delta' is the elapsed time since the previous frame.


func _process(delta):
	if player !=null and running:
		var f1x = position.x - player.position.x
		var f2x = position.x - player.position.x + 1152
		var f3x = position.x - player.position.x - 1152
	
		var f1y = position.y - player.position.y
		var f2y = position.y - player.position.y + 648
		var f3y = position.y - player.position.y - 648
	
	
		fuite.x = min(abs(f1x),abs(f2x),abs(f3x))
		if fuite.x == abs(f1x):
			fuite.x = - f1x
		elif fuite.x == abs(f2x):
			fuite.x = - f2x
		elif fuite.x == abs(f3x):
			fuite.x = -f3x
		fuite.y = min(abs(f1y),abs(f2y),abs(f3y))
		if fuite.y == abs(f1y):
			fuite.y = -f1y
		elif fuite.y == abs(f2y):
			fuite.y = -f2y
		elif fuite.y == abs(f3y):
			fuite.y = -f3y
	
		fuite = fuite.normalized()
		position += fuite * speed * delta
		
		if position.x < 0:
			position.x = 1152
		if position.x > 1152:
			position.x = 0
		if position.y < 0:
			position.y = 648
		if position.y > 648:
			position.y = 0
	

func _on_area_entered(area):
	if area.type =="bacteria":
		touched = true
		

