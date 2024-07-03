extends Node2D

@onready var spawn = $spawn
var ball_pr = preload("res://ball.tscn")

func _ready():
	ball_spawn()

func ball_spawn():
	var ball = ball_pr.instantiate()
	ball.position = spawn.position
	call_deferred("add_child", ball)
	ball.destroyed.connect(ball_spawn)
	return ball
