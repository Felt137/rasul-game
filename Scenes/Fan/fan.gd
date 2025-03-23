extends StaticBody2D

const ROTATION_SPEED = 7

func _process(delta):
	$Fan.rotate(ROTATION_SPEED * delta)
