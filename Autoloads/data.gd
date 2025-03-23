extends Node

const data_path = "user://data.save"
var dict: Dictionary = {
	"high_score" : 0,
	"language" : "Русский",
	"master_volume" : 0.0,
	"music_volume" : 0.0 
}

func _ready():
#	save_data()
#	get_tree().quit()
	load_data()
	TranslationServer.set_locale(dict.language)

func load_data():	
	if FileAccess.file_exists(data_path):
		var file = FileAccess.open(data_path, FileAccess.READ)
		var loaded_dict: Dictionary = file.get_var()
		dict.merge(loaded_dict, true)
#		if dict.size() > loaded_dict.size():
#			for pair in dict:
#				if !(pair in loaded_dict):
#		dict = loaded_dict

func save_data():
	var file = FileAccess.open(data_path, FileAccess.WRITE)
	file.store_var(dict)

func set_var(variable: String, value):
	if !variable in dict:
		printerr("data.gd: set_var() variable " + variable +  "is not in dict")
		get_tree().quit()
	dict[variable] = value
	save_data()

func get_var(variable: String):
	return dict[variable]
