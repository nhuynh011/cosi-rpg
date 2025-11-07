extends CharacterBody2D

const speed = 10;

func _ready():
	pass
	
func _physics_process(_delta: float) -> void:
	if Input.is_action_pressed(&"move_right"):
		move_and_collide(Vector2(speed, 0))
	if Input.is_action_pressed(&"move_left"):
		move_and_collide(Vector2(-speed, 0))
	if Input.is_action_pressed(&"move_down"):
		move_and_collide(Vector2(0, speed))
	if Input.is_action_pressed(&"move_up"):
		move_and_collide(Vector2(0, -speed))
