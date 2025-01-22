extends Node2D



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction := Vector2.ZERO
	direction =  global_position.direction_to(get_global_mouse_position())
	rotation = direction.angle()
