extends Node

signal hell_started	
signal game_over
signal new_kill
signal new_bobik
signal locale_changed

const GOD_MODE = 0
const MENU_POPUPS_LIMIT = 12
const SAVE_PATH = "user://savegame.save"

var mode: int
var player_position: Vector2
var kill_cnt: int
var game_state: int
var bobik_cnt: int
var entity_speed

func _init():
	mode = 0
	kill_cnt = 0
	game_state = 0
	bobik_cnt = 0
	entity_speed = 400

func start_hell():
	mode = 1
	kill_cnt = 0
	bobik_cnt = 0
	hell_started.emit()

func death():
	game_state = 1
	game_over.emit()

func bobik_kill():
	game_state = 2
	game_over.emit()
	
func get_score() -> int:
	return kill_cnt + bobik_cnt
