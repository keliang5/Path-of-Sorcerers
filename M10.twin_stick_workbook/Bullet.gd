extends Area2D
var max_range := 1000.0
@export var speed := 900
var distance_traveled = 0.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _physics_process(delta: float) -> void:
	var distance:= speed * delta
	var motion := Vector2.RIGHT.rotated(rotation) * distance
	
	position += motion
	
	distance_traveled += distance
	if distance_traveled > max_range:
		_destroy()
	
func _destroy():
	queue_free()
