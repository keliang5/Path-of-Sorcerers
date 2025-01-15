extends Sprite2D

const P_DOWN= preload("res://player/godot_bottom.png")
const P_DOWN_RIGHT = preload("res://player/godot_bottom_right.png")
const P_RIGHT = preload("res://player/godot_right.png")
const P_UP = preload("res://player/godot_up.png")
const P_UP_RIGHT = preload("res://player/godot_up_right.png")

const UP_RIGHT = Vector2.UP + Vector2.RIGHT
const UP_LEFT = Vector2.UP + Vector2.LEFT
const DOWN_RIGHT = Vector2.DOWN + Vector2.RIGHT
const DOWN_LEFT = Vector2.LEFT + Vector2.DOWN



func _physics_process(_delta: float) -> void:
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	var direction_discrete := direction.sign()
	match direction_discrete:
		Vector2.RIGHT, Vector2.LEFT:
			texture = P_RIGHT
		Vector2.UP:
			texture = P_UP
		Vector2.DOWN:
			texture = P_DOWN
		UP_RIGHT, UP_LEFT:
			texture = P_UP_RIGHT
		DOWN_RIGHT, DOWN_LEFT:
			texture = P_DOWN_RIGHT
	if direction_discrete.length() > 0:
		flip_h = direction_discrete.x < 0.0
