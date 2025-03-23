extends AnimatedSprite2D

const HELLS_SPEED_SCALE = 2.0

var unlucky = false

func _ready():
	var rand = randi() % 5 / 10.0 + 1
	scale = Vector2(rand, rand)
	play(str(randi() % 3 + 1))
	if Info.mode == 1:
		$AudioStreamPlayer2D.volume_db -= 8
		speed_scale = HELLS_SPEED_SCALE
		#scale = Vector2(0.3, 0.3)

func _on_animation_finished():
	queue_free()


func _on_timer_timeout():
	$Area2D.queue_free()
