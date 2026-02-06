extends CharacterBody2D
var can_tp = true
@export var speed: float = 375.0

func _physics_process(delta: float) -> void:
	var dir := Vector2.ZERO

	if Input.is_action_pressed("move_up"):
		dir.y -= 1
	if Input.is_action_pressed("move_down"):
		dir.y += 1
	if Input.is_action_pressed("move_left"):
		dir.x -= 1
	if Input.is_action_pressed("move_right"):
		dir.x += 1

	dir = dir.normalized()
	velocity = dir * speed
	move_and_slide()
