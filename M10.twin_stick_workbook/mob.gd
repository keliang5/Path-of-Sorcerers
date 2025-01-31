class_name Mob extends CharacterBody2D
@export var health := 5: set= set_health
@export var max_speed := 250.0
@export var acceleration := 700.0
var _player: Player = null

@onready var _agrro: Area2D = $Agrro
@onready var hitbox: Area2D = $Hitbox
@onready var damage_timer: Timer = $Timer

@export var damage = 1.0


func _ready() -> void:
	_agrro.body_entered.connect(func (body:Node) -> void:
		if body is Player:
			_player = body
		)
	_agrro.body_exited.connect(func (body: Node) -> void:
		if body is Player:
			_player = null
	)
	hitbox.body_entered.connect(func (body: Node) -> void:
		if body is Player:
			body.health -= damage
			damage_timer.start()
	)
	hitbox.body_exited.connect(func (body: Node) -> void:
		if body is Player:
			damage_timer.stop()
	)
	damage_timer.timeout.connect(func ()-> void:
		_player.health -= damage
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


func set_health(new_health: int) -> void:
	health = new_health
	if health <=0:
		die()

func die() -> void:
	queue_free()
