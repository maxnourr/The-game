extends Area2D
static var score = 0
static var speed = 300.0
var fuite = Vector2.ZERO
static var player = null
static var running = false
var type = "food"
	
func set_player(P):
	player = P
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player !=null and running:
		var f1x = position.x - player.position.x
		var f2x = position.x - player.position.x + get_viewport().size.x
		var f3x = position.x - player.position.x - get_viewport().size.x
	
		var f1y = position.y - player.position.y
		var f2y = position.y - player.position.y + get_viewport().size.y
		var f3y = position.y - player.position.y - get_viewport().size.y
	
		if pow(min(abs(f1x),abs(f2x),abs(f3x)),2)+pow(min(abs(f1y),abs(f2y),abs(f3y)),2) < pow(150,2)*2:
			fuite.x = min(abs(f1x),abs(f2x),abs(f3x))
			if fuite.x == abs(f1x):
				fuite.x = f1x
			elif fuite.x == abs(f2x):
				fuite.x = f2x
			elif fuite.x == abs(f3x):
				fuite.x = f3x
			fuite.y = min(abs(f1y),abs(f2y),abs(f3y))
			if fuite.y == abs(f1y):
				fuite.y = f1y
			elif fuite.y == abs(f2y):
				fuite.y = f2y
			elif fuite.y == abs(f3y):
				fuite.y = f3y
	
		fuite = fuite.normalized()
		position += fuite * speed * delta
		
		if position.x < 0:
			position.x = get_viewport().size.x
		if position.x > get_viewport().size.x:
			position.x = 0
		if position.y < 0:
			position.y = get_viewport().size.y
		if position.y > get_viewport().size.y:
			position.y = 0
	

func _on_area_entered(area):
	if area.type == "player":
		score +=1
		if name != "food":
			queue_free()
		else:
			visible = false
			$CollisionShape2D.set_deferred("disabled", true)

func destroy():
	score = 0
