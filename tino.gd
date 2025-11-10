extends Area2D

var config: Node

func _ready() -> void:
	config = $"/root/SaveData"
	visible = config.load_tino() 

func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_T:
			visible = not visible
			config.update_tino(visible)
		elif event.pressed and event.keycode == KEY_ESCAPE:
			get_tree().quit()
