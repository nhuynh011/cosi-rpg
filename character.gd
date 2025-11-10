extends CharacterBody2D

const speed: float = 80000

@onready var animation_player = $AnimatedSprite2D
@onready var save_data: SaveData = $"/root/SaveData"


func _physics_process(delta: float) -> void:
	var vec: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")

	update_animation(vec)
	
	if vec == Vector2.ZERO:
		velocity = Vector2.ZERO
	else:
		velocity = vec.normalized() * speed * delta
		move_and_slide()


func update_animation(direction: Vector2) -> void:
	# choose animation, with priority for left and right
	if direction == Vector2.ZERO: # not moving
		animation_player.stop()
	elif abs(direction.x) > 0.01: # moving left / right
		if direction.x > 0.01:
			animation_player.play("moving_right")
		else:
			animation_player.play("moving_left")
	else: # moving up / down
		if direction.y > 0.01:
			animation_player.play("moving_down")
		else:
			animation_player.play("moving_up")


func _on_enter_tino_fight(body: Node2D) -> void:
	if body.name == "MainCharacter" and save_data.load_tino():
		get_tree().change_scene_to_file("res://battle.tscn")
