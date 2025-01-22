class_name Mob extends CharacterBody2D

@export var max_speed := 250.0
@export var acceleration := 700.0
var _player: player = null

@onready var _agrro: Area2D = $Agrro

func _ready() -> void:
	_agrro.body_entered.connect(func (body:Node) -> void:
		if body is player:
			_player = body
		)
	_agrro.body_exited.connect(func (body: Node) -> void:
		if body is player:
			_player = null
	)
func _physics_process(delta: float) -> void:
	if _player ==null:
		velocity = velocity.move_toward(Vector2.ZERO, acceleration * delta)
	else:
		var direction := global_position.direction_to(_player.global_position)
		var distance := global_position.distance_to(_player.global_position)
		var speed := max_speed if distance > 120.0 else max_speed * distance / 120.0
		var desired_velocity := direction * speed
		velocity = velocity.move_toward(desired_velocity, acceleration *delta)
		
		move_and_slide()
