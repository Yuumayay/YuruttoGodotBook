extends CharacterBody2D

@export var move_speed: int
@export var move_direction: int = 1
@export var can_tread: bool

@onready var sprite = $Sprite

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _physics_process(delta : float):
	# 重力を加える
	if not is_on_floor():
		velocity += get_gravity() * delta
	velocity.x = move_speed * move_direction
	if move_direction == -1:
		sprite.flip_h = true
	else:
		sprite.flip_h = false
	move_and_slide()


func _on_area_body_entered(body):
	if body.name == "Character" and can_tread:
		Audio.get_node("Hit").play()
		queue_free()


func _on_enemy_hitbox_body_entered(body):
	if body.name == "Character":
		body.knockback()
		UI.damage(20)
