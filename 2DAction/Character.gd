extends CharacterBody2D

var can_move: bool = true

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var sprite = $Sprite

var state = "stand"

func _physics_process(delta : float):
	# 重力を加える
	if not is_on_floor():
		state = "fall"
		velocity += get_gravity() * delta
		if velocity.y > 0.0:
			sprite.play("fall")
		else:
			sprite.play("jump")
	else:
		if state == "fall":
			state = "land"
			sprite.play("land", 4.0)
			await sprite.animation_looped
			state = "stand"

	# ジャンプ処理
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		Audio.get_node("Jump").play()
		velocity.y = JUMP_VELOCITY

	# 入力方向を取得し、移動・減速を処理
	# ui_left ui_rightは自分のアクションに置き換えたほうがいいよ
	var direction = Input.get_axis("ui_left", "ui_right")
	if !can_move:
		pass
	elif direction:
		if direction == -1:
			sprite.flip_h = true
		else:
			sprite.flip_h = false
		if state == "stand":
			sprite.play("walk")
		velocity.x = direction * SPEED
	else:
		if state == "stand":
			sprite.play("idle")
		velocity.x = move_toward(velocity.x, 0, SPEED)

	# y=1500よりさらに落下した場合、やられる
	if position.y > 1500:
		UI.damage(100)

	move_and_slide()

func knockback():
	can_move = false
	if sprite.flip_h == true:
		velocity = Vector2(100, -300)
	else:
		velocity = Vector2(-100, -300)
	await get_tree().create_timer(0.5).timeout
	can_move = true
