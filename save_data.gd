extends Node

const save_file = "user://save.cfg"
var _config: ConfigFile


func _init() -> void:
	_config = ConfigFile.new()
	if FileAccess.file_exists(save_file):
		_config.load(save_file)
	else:
		_create_default_save()


func _create_default_save() -> void:
	_config.set_value("map", "tino", false)
	_config.save(save_file)


func update_tino(value: bool) -> void:
	_config.set_value("map", "tino", value)
	_config.save(save_file)


func load_tino() -> bool:
	return _config.get_value("map", "tino")
