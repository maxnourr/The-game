extends Area2D
var amount = 0.
var expected_amount = 0.
var speed = 10
# à changer à chaque difficulté, * 10 max car sinon possible d'avoir un cas ou amount 
# ne pourra pas rentrer dans la marge voulu de expected_amount +-10
var rng = RandomNumberGenerator.new()
var waiting = 0 # wait est là pour que la victoire ne soit pas auto une fois au bon endroit
#elle force à attendre un peu

# Called when the node enters the scene tree for the first time.
func _ready():
	expected_amount = rng.randf_range(50, 200)
	
	$ColorRect.size.y = 0
	$ColorRect2.position.y = $ColorRect2.position.y - expected_amount
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_down"):
		amount += -1
	if Input.is_action_pressed("ui_up"):
		amount += 1
	$ColorRect.size.y = amount * speed
	
	if (amount * speed)  >= (expected_amount - 5) and (amount * speed)  <= (expected_amount + 5):
		waiting += 1

