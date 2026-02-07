extends CharacterBody2D

@export var speed: float = 375.0

@onready var anim: AnimatedSprite2D = $Anim
var can_tp = true

# Change these if your animation names are different.
const WALK_PREFIX := "walking_"
const IDLE_PREFIX := "idle_"

# If you do NOT have idle animations, set this to false.
@export var has_idle_animations: bool = false

# Tracks last direction so idle faces the last moved direction.
var last_dir_name: String = "s"  # default facing south

func _physics_process(_delta: float) -> void:
	var input_dir := Vector2.ZERO

	if Input.is_action_pressed("move_up"):
		input_dir.y -= 1
	if Input.is_action_pressed("move_down"):
		input_dir.y += 1
	if Input.is_action_pressed("move_left"):
		input_dir.x -= 1
	if Input.is_action_pressed("move_right"):
		input_dir.x += 1

	input_dir = input_dir.normalized()
	velocity = input_dir * speed
	move_and_slide()

	_update_animation(input_dir)

func _update_animation(dir: Vector2) -> void:
	# If not moving: play idle
	if dir == Vector2.ZERO:
		if has_idle_animations:
			_play_if_exists(IDLE_PREFIX + last_dir_name)
		else:
			# No idle anims: just stop on last frame of last walk anim
			anim.pause()
		return

	# Moving: determine which of 8 directions
	var dir_name := _dir_to_8way_name(dir)
	last_dir_name = dir_name

	_play_if_exists(WALK_PREFIX + dir_name)

func _dir_to_8way_name(dir: Vector2) -> String:
	# Screen coords: up is negative Y.
	var x := dir.x
	var y := dir.y

	# Use thresholds to determine 8-way direction
	# These values avoid jitter near diagonals
	var diag_threshold := 0.35

	if abs(x) < diag_threshold:
		# Mostly vertical
		return "n" if y < 0.0 else "s"
	if abs(y) < diag_threshold:
		# Mostly horizontal
		return "w" if x < 0.0 else "e"

	# Diagonals
	if x > 0.0 and y < 0.0:
		return "ne"
	if x < 0.0 and y < 0.0:
		return "nw"
	if x > 0.0 and y > 0.0:
		return "se"
	return "sw"


func _play_if_exists(name: String) -> void:
	if anim.sprite_frames == null:
		return

	if anim.sprite_frames.has_animation(name):
		if anim.animation != name or !anim.is_playing():
			anim.play(name)
	else:
		# Fallback: if you only have walk animations but asked for idle,
		# try falling back from idle_x -> walk_x
		if name.begins_with(IDLE_PREFIX):
			var walk_name := WALK_PREFIX + name.substr(IDLE_PREFIX.length())
			if anim.sprite_frames.has_animation(walk_name):
				if anim.animation != walk_name or !anim.is_playing():
					anim.play(walk_name)
