@tool
class_name Pickup extends Area2D

@export var item: Item = null: set = set_item
@onready var sprite: Sprite2D = %Sprite2D
@onready var audio_stream_player: AudioStreamPlayer2D = %AudioStreamPlayer2D
@onready var animation_player: AnimationPlayer = %AnimationPlayer


func _ready() -> void:
	set_item(item)
	body_entered.connect(func(body: Node) -> void:
		if body is Player:
			item.use(body)
			animation_player.play("destroy")
			set_deferred("monitoring", false)
			audio_stream_player.play()
			animation_player.animation_finished.connect(func(animation_name: String) ->void:
				queue_free()
				)
		)

func set_item(value: Item) -> void:
	item = value
	if sprite!= null:
		sprite.texture = item.texture
	if audio_stream_player != null:
		audio_stream_player.stream = item.sound_on_pickup
