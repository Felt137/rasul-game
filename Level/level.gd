extends Node

func _ready():
	Info.hell_started.connect(hell_started)
	get_tree().paused = false

func hell_started():
	$Timers/EntitySpawn.wait_time /= 1.6
	Info.entity_speed *= 1.3

func _on_spawn_speed_increase_timeout():
	if Info.mode == 0:
		$Timers/EntitySpawn.wait_time *= 0.94
	else:
		$Timers/EntitySpawn.wait_time *= 0.75
	$Timers/SpawnSpeedIncrease.wait_time *= 1.1
	$Timers/SpawnSpeedIncrease.start()

func _on_entity_speed_increase_timeout():
	Info.entity_speed += 5
