extends Area2D

const STARTING_DODGE_SPEED = 3000
const DODGE_SPEED_DECELERATION = 13500
const MIN_DIST_FOR_DODGING = 600
const HELL_SCALE = 1.3
const DODGE_CHANCE = 30

var type: int
var speed = Info.entity_speed
var dodge_speed = 0
var gone: bool = false
var dodging_left: bool

func hell_started():
	if type == 1:
		$AnimationPlayer.play("bobik_fade")
	else:
		$AnimationPlayer.play("normal_fade")
	set_process(false)

func _ready():
	Info.hell_started.connect(hell_started)
	if Info.mode == 1:
		scale = Vector2(HELL_SCALE, HELL_SCALE)
	if false && randi() % 300 == 0:
		$AnimatedSprite2D.frame = 2
		type = 2
	if Info.mode != 1 && randi() % 10 == 0:
		$AnimatedSprite2D.frame = randi() % 2
		type = 1
		$BobikAttributes.visible = true
	else:
		$AnimatedSprite2D.frame = randi() % 10 + 3
		type = 0
		if $AnimatedSprite2D.frame == 3:
			$AnimatedSprite2D.rotation_degrees = 90
	

func _process(delta):
	#big pipi direction
	if $AnimatedSprite2D.frame == 3:
		look_at(Info.player_position)

	#dodge_speed = move_toward(dodge_speed, 0, DODGE_SPEED_DECELERATION * delta * 0.5)
	dodge_speed = move_toward(dodge_speed, 0, DODGE_SPEED_DECELERATION * delta)
	#calculating direction
	var dir = (Info.player_position - position).normalized()
	var dodge_dir: Vector2
	if dodging_left:
		dodge_dir = Vector2(-dir.y, dir.x)
	else:
		dodge_dir = Vector2(dir.y, -dir.x)
	#moving
	if type != 1:
#		if acceleration_started:
#			speed += acceleration
		position += (dir * speed + dodge_dir * dodge_speed) * delta
	else:
		position += dir * speed * delta * 1.35
	#we need second calc here because of integrals or smth
	#dodge_speed = move_toward(dodge_speed, 0, DODGE_SPEED_DECELERATION * delta * 0.5)
		

func _on_area_entered(area):
	if !$DodgeTimer.is_stopped() || $AnimationPlayer.is_playing() || gone:
		return
	if randi() % DODGE_CHANCE == 0 && Info.mode == 0 && (Info.player_position - position).length() > MIN_DIST_FOR_DODGING:
		$DodgeTimer.start()
		dodge_speed = STARTING_DODGE_SPEED
		dodging_left = randi() % 2
		return
	if type == 0:
		gone = true
		Info.kill_cnt += 1
		Info.new_kill.emit()
		queue_free()
	elif type == 1:
		Info.bobik_kill()

func _on_body_entered(body):
	if gone:
		return
	if type == 0:
		Info.death()
	else:
		gone = true
		Info.bobik_cnt += 1
		Info.new_bobik.emit()
		queue_free()
