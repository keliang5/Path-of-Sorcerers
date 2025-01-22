extends Area2D
var max_range := 1000.0
@export var speed := 900
var distance_traveled = 0.0
@onready var bullet: Area2D = $"."
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bullet.body_entered.connect(func (body: Node) -> void:
		if body is Mob:
			body.health -= 1
			_destroy()
		)


func _physics_process(delta: float) -> void:
	var distance:= speed * delta
	var motion := Vector2.RIGHT.rotated(rotation) * distance
	
	position += motion
	
	distance_traveled += distance
	if distance_traveled > max_range:
		_destroy()
	
func _destroy():
	queue_free()
