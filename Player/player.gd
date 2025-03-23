extends CharacterBody2D

var explotion = preload("res://Scenes/Explotions/Explotion.tscn")
var instance
const SPEED = 500

func _process(delta):
	#moving
	var move_direction = Input.get_vector("left", "right", "up", "down")
	velocity = move_direction * SPEED
	Info.player_position = position
	move_and_slide()
	
	#rotation
	var angle = (get_global_mouse_position() - position).angle()
	if rotation < -PI:
		rotation += TAU
	elif rotation > PI:
		rotation -= TAU
	if rotation - angle > PI:
		angle += TAU
	elif angle - rotation > PI:
		angle -= TAU
	var next_rotation = move_toward(rotation, angle, delta * max(1, 10 * sqrt(abs(rotation - angle))))	
	rotation = next_rotation

func _physics_process(delta):
	#shooting with explotions
	if Info.mode == 0:
		if Input.is_action_just_pressed("Click"):
			instance = explotion.instantiate()
			get_tree().root.add_child(instance)
			instance.position = get_global_mouse_position()
	elif Info.mode == 1:
		if Input.is_action_pressed("Click"):
			instance = explotion.instantiate()
			get_tree().root.add_child(instance)
			instance.position = get_global_mouse_position()
