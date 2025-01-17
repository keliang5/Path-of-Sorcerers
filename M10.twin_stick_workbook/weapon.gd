class_name weapon extends Node2D

@export var bullet_scene: PackedScene = preload("res://Bullet.tscn")
@export_range (0.0, 360.0, 1.0, "randians_as_degrees") var random_angle := PI/12.0
@export_range (100.0, 2000.0, 1.0) var max_range := 2000.0
@export_range(100.0, 3000.0, 1.0) var max_bullet_speed:= 1500.0

func _ready() -> void:
	if Engine.is_editor_hint():
		set_physics_process(false)


func shoot():
	var bullet: Node = bullet_scene.instantiate()
	get_tree().current_scene.add_child(bullet)
	
	bullet.global_position = global_position
	bullet.global_rotation = global_rotation
	bullet.max_range = max_range
	bullet.speed = max_bullet_speed
	bullet.rotation += randf_range(-random_angle/2.0, random_angle/2.0)
	
func _physics_process(delta: float) -> void:
	if  Input.is_action_just_pressed("shoot"):
		shoot()
		
