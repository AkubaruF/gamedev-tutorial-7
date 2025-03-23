extends CharacterBody3D

@export var speed: float = 10.0
@export var acceleration: float = 5.0
@export var gravity: float = 9.8
@export var jump_power: float = 5.0
@export var mouse_sensitivity: float = 0.3
@export var speed_modifier: float = 2.0

@onready var head: Node3D = $Head
@onready var camera: Camera3D = $Head/Camera3D

@export var lamp: PackedScene

var camera_x_rotation: float = 0.0
var head_position_y

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	head_position_y = head.position.y

func _input(event):
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		head.rotate_y(deg_to_rad(-event.relative.x * mouse_sensitivity))
		var x_delta = event.relative.y * mouse_sensitivity
		camera_x_rotation = clamp(camera_x_rotation + x_delta, -90.0, 90.0)
		camera.rotation_degrees.x = -camera_x_rotation
	if Input.is_action_just_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _physics_process(delta):
	var movement_vector = Vector3.ZERO

	if Input.is_action_pressed("movement_forward"):
		movement_vector -= head.basis.z
	if Input.is_action_pressed("movement_backward"):
		movement_vector += head.basis.z
	if Input.is_action_pressed("movement_left"):
		movement_vector -= head.basis.x
	if Input.is_action_pressed("movement_right"):
		movement_vector += head.basis.x

	movement_vector = movement_vector.normalized()
	
	if Input.is_action_pressed("sprint"):
		speed_modifier = 1.5
	elif Input.is_action_pressed("crouch"):
		head.position.y = head_position_y - 1
		speed_modifier = 0.5
	else:
		head.position.y = head_position_y
		speed_modifier = 1

	velocity.x = lerp(velocity.x, movement_vector.x * speed * speed_modifier, acceleration * delta)
	velocity.z = lerp(velocity.z, movement_vector.z * speed * speed_modifier, acceleration * delta)

	# Apply gravity
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Jumping
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_power
	
	if Input.is_action_just_pressed("place"):
		if Global.lamps_count > 0:
			Global.lamps_count -= 1
			var spawned = lamp.instantiate()
			get_parent().add_child(spawned)
			spawned.global_position = global_position + $Head/Camera3D.global_basis * Vector3.FORWARD * 4
		
	move_and_slide()
