extends CharacterBody2D

var screen_size

func _ready():
	screen_size = get_viewport_rect().size
	
func _physics_process(_delta: float) -> void:
	if Input.is_action_pressed(&"move_right"):
		position += Vector2(10, 0)
	if Input.is_action_pressed(&"move_left"):
		position += Vector2(-10, 0)
	if Input.is_action_pressed(&"move_down"):
		position += Vector2(0, 10)
	if Input.is_action_pressed(&"move_up"):
		position += Vector2(0, -10)
	
	position = position.clamp(Vector2.ZERO, screen_size)
