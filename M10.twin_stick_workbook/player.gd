class_name player extends CharacterBody2D

@export var speed := 460.0
@export var drag_factor := 10.0
@export var max_health := 5.0
@onready var _collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var health_bar: ProgressBar = $healthBar

var health := max_health: set = set_health

func _ready() -> void:
	health_bar.max_value = max_health
	health_bar.value = health


func _physics_process(delta: float) -> void:
	var move_direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var desired_velocity:= speed * move_direction
	var steering := desired_velocity - velocity
	velocity += steering * drag_factor * delta
	move_and_slide()

func set_health(new_health: int) -> void:
	var previous_health := health
	health = clampi(new_health, 0, max_health)
	health_bar.value = health
	
	if health == 0:
		die()
		
func die() -> void:
	queue_free()
