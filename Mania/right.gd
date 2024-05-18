extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("1") and Input.is_action_pressed("2"):
		frame = 3
	elif Input.is_action_pressed("1"):
		frame = 2
	elif Input.is_action_pressed("2"):
		frame = 1
	else:
		frame = 0
