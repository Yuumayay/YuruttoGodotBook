extends RigidBody2D

const MAX_FORCE := 1000.0

var hit_pr = preload("res://ball_hit.ogg")
var pop_pr = preload("res://pop.wav")
var clear_pr = preload("res://get2.wav")

signal destroyed

func _ready():
	var hit = AudioStreamPlayer.new()
	hit.stream = hit_pr
	hit.name = "hit"
	add_child(hit)

func _process(delta):
	if Input.is_action_just_pressed("click"):
		var mouse_pos = get_global_mouse_position()
		var dir = mouse_pos.direction_to(position)
		linear_velocity += dir * MAX_FORCE
#func _process(delta):
#	if Input.is_action_just_pressed("click"):
#		var pow = lerp(1.0, 0.0, clamp(position.distance_to(get_global_mouse_position()), 0, 200) / 200.0)
#		var dir = position.direction_to(get_global_mouse_position())
#		linear_velocity += -dir * pow * MAX_FORCE
		print(dir)
#		$hit.volume_db = lerp(-20.0, 20.0, pow)
		$hit.play()

func destroy():
	var pop = AudioStreamPlayer.new()
	pop.stream = pop_pr
	$/root.add_child(pop)
	pop.play()
	destroyed.emit()
	print("oof")
	queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited():
	destroy()




func _on_area_2d_body_entered(body):
	clear()

func clear():
	print("clear")
	var clear1 = AudioStreamPlayer.new()
	clear1.stream = clear_pr
	$/root.add_child(clear1)
	clear1.play()
	Game.level += 1
	if Game.level == 15:
		Game.state = Game.END
	Game.change_scene(Game.level)


func _on_area_2d_2_body_entered(body):
	destroy()
