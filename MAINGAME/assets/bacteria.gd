extends Area2D
var scalx
var scaly
var timer
static var C = Color(1, 1, 1)
static var logo = false
# Called when the node enters the scene tree for the first time.
func _ready():
	scalx = 0.4
	scaly = 0.4
	change_color(C)
	$"48C".visible = logo
	
func change_color(color):
	C = color
	modulate = Color(1, 1, 1,0.624)
	$body.modulate = C
	$flagel.modulate = C
	$flagel2.modulate = C
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer = 100
	$SPAC.visible = false
	$EC20.visible = false
	if PlayerVar.SPAC == true:
		$SPAC.visible = true
		$SPAC.modulate = Color(1,1,1,(timer/100))
	if PlayerVar.EC20 == true:
		$EC20.visible = true
	if PlayerVar.FtsZ == true and PlayerVar.Play:
		scale.x = scalx
		scale.y = scaly
		if scalx < 0.7:
			scalx += 0.01
		if scaly >0.1:
			scaly += -0.01
		
	if PlayerVar.Mucus ==true:
		PlayerVar.SPAC = true
		timer = 100.
	if PlayerVar.Mucus == false and timer > 0:
		timer += -0.2
	if timer <= 0:
		PlayerVar.SPAC = false
