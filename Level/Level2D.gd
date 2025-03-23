extends Node2D

const SPAWN_RADIUS = 1500
var entity = preload("res://Scenes/Entity/entity.tscn")

func spawn_entity():
	var y = randi() % (2 * SPAWN_RADIUS) - SPAWN_RADIUS
	var x = sqrt(SPAWN_RADIUS * SPAWN_RADIUS - y * y)
	if randi() % 2:
		x = -x
	var instance = entity.instantiate()
	instance.position = $Player.position + Vector2(x, y)
	get_tree().current_scene.add_child(instance)


func _on_entity_spawn_timeout():
	spawn_entity()
