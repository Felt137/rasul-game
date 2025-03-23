extends CharacterBody2D

const SPEED = 400

func _process(_delta):
	velocity = Vector2(SPEED, 0);
	move_and_slide()
